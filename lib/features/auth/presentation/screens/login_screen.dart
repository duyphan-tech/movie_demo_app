import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/theme/app_color.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_text_field.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';

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

    debugPrint('inside build');

    ref.listen<AsyncValue<bool>>(authProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.error.toString().replaceAll('Exception: ', ''),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    void onSubmit() {
      if (formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        ref.read(authProvider.notifier).login(email, password);
      }
    }

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
                  const Icon(
                    AppIcon.movie_filter_rounded,
                    size: 80,
                    color: AppColor.primaryColor,
                  ),

                  Gap(40),

                  Consumer(
                    builder: (context, ref, child) {
                      final isLoading = ref.watch(authProvider).isLoading;
                      return CustomTextField(
                        controller: emailController,
                        onFieldSubmitted: (_) {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                        label: 'Username / Email',
                        textInputAction: TextInputAction.next,
                        enabled: !isLoading,
                        prefixIcon: Icons.person_outline,
                        validator: (value) => (value == null || value.isEmpty)
                            ? context.l10n.enterAccountError
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  ValueListenableBuilder<bool>(
                    valueListenable: isPasswordVisible,
                    builder: (context, isVisible, child) {
                      debugPrint('Rebuild Password Field Only');
                      final isLoading = ref.watch(authProvider).isLoading;

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

                  // HookConsumer(
                  //   builder: (context, ref, child) {
                  //     final isLoading = ref.watch(authProvider).isLoading;

                  //     final isPasswordVisible = useState(false);

                  //     debugPrint('inside HookConsumer - Password');

                  //     return CustomTextField(
                  //       controller: passwordController,
                  //       label: 'Password',
                  //       focusNode: passwordFocusNode,
                  //       obscureText: !isPasswordVisible.value,
                  //       enabled: !isLoading,
                  //       textInputAction: TextInputAction.done,
                  //       prefixIcon: Icons.lock_outline,
                  //       validator: (value) =>
                  //           (value == null || value.length < 3)
                  //           ? context.l10n.passwordTooShortError
                  //           : null,
                  //       onFieldSubmitted: (_) => onSubmit(),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(
                  //           isPasswordVisible.value
                  //               ? Icons.visibility
                  //               : Icons.visibility_off,
                  //         ),
                  //         onPressed: () => isPasswordVisible.value =
                  //             !isPasswordVisible.value,
                  //       ),
                  //     );
                  //   },
                  // ),
                  Gap(24),

                  Consumer(
                    builder: (context, ref, child) {
                      final isLoading = ref.watch(authProvider).isLoading;

                      return ElevatedButton(
                        onPressed: isLoading ? null : onSubmit,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                          // ignore: deprecated_member_use
                          // shadowColor: Colors.indigo.withOpacity(0.4),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                context.l10n.signIn,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  inherit: true,
                                ),
                              ),
                      );
                    },
                  ),

                  Gap(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
