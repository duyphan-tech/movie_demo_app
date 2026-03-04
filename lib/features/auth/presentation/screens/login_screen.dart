import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_text_field.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/login_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(
      text: kDebugMode ? 'emilys' : '',
    );
    final passwordController = useTextEditingController(
      text: kDebugMode ? 'emilyspass' : '',
    );
    final passwordFocusNode = useFocusNode();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isPasswordVisible = useValueNotifier(false);

    AppLogger.d('Building LoginScreen', tag: 'Login');

    ref.listen<AsyncValue<LoginResult>>(loginProvider, (previous, next) {
      if (next.isLoading) {
        EasyLoading.show(status: context.l10n.loading);
      } else {
        EasyLoading.dismiss();
      }

      if (next.hasError && !next.isLoading) {
        EasyLoading.showError(
          next.error.toString().replaceAll('Exception: ', ''),
          duration: const Duration(seconds: 3),
        );
      }

      if (next.hasValue && !next.isLoading && next.value != null) {
        final pendingLinkAsync = ref.read(pendingDeepLinkProvider);
        final pendingLink = pendingLinkAsync.hasValue
            ? pendingLinkAsync.value
            : null;

        AppLogger.i('Login success, pendingLink: $pendingLink', tag: 'Login');

        if (pendingLink != null && pendingLink.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLogger.i('Navigating to pending deep link: $pendingLink', tag: 'Login');
            ref.read(pendingDeepLinkProvider.notifier).clearPendingDeepLink();
            context.go(pendingLink);
          });
        }
      }
    });

    void onSubmit() {
      if (formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        ref.read(loginProvider.notifier).login(email, password);
      }
    }

    final isLoading = ref.watch(loginProvider.select((s) => s.isLoading));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    AppIcon.movieFilterRounded,
                    size: 80,
                    color: context.brandPrimary,
                  ),

                  context.gapXxl,

                  CustomTextField(
                    controller: emailController,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    label: 'Username / Email',
                    textInputAction: TextInputAction.next,
                    enabled: !isLoading,
                    prefixIcon: Icons.person_outline,
                    validator: (value) => (value == null || value.isEmpty)
                        ? context.l10n.enterAccountError
                        : null,
                  ),
                  context.gapLg,

                  ValueListenableBuilder<bool>(
                    valueListenable: isPasswordVisible,
                    builder: (context, isVisible, child) {
                      AppLogger.d('Rebuild Password Field Only', tag: 'Login');

                      return CustomTextField(
                        controller: passwordController,
                        label: 'Password',
                        focusNode: passwordFocusNode,

                        obscureText: !isVisible,

                        enabled: !isLoading,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () => isPasswordVisible.value = !isVisible,
                        ),
                        onFieldSubmitted: (_) => onSubmit(),
                        validator: (value) =>
                            (value == null || value.length < 3)
                            ? context.l10n.passwordTooShortError
                            : null,
                      );
                    },
                  ),

                  context.gapXl,

                  ElevatedButton(
                    onPressed: isLoading ? null : onSubmit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: RadiusTokens.buttonRadius,
                      ),
                      elevation: 4,
                      animationDuration: Duration.zero,
                    ),
                    child: Text(
                      context.l10n.signIn,
                      style: context.labelLg.copyWith(inherit: true),
                    ),
                  ),

                  context.gapLg,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
