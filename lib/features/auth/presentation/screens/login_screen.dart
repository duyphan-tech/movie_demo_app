import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    print('inside build');

    ref.listen<AsyncValue<bool>>(authControllerProvider, (previous, next) {
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
        ref.read(authControllerProvider.notifier).login(email, password);
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.movie_filter_rounded,
                    size: 80,
                    color: Colors.indigo,
                  ),

                  const SizedBox(height: 40),

                  Consumer(
                    builder: (context, ref, child) {
                      final isLoading = ref
                          .watch(authControllerProvider)
                          .isLoading;
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

                  HookConsumer(
                    builder: (context, ref, child) {
                      final isLoading = ref
                          .watch(authControllerProvider)
                          .isLoading;

                      final isPasswordVisible = useState(false);

                      print('inside HookConsumer - Password');

                      return CustomTextField(
                        controller: passwordController,
                        label: 'Password',
                        focusNode: passwordFocusNode,
                        obscureText: !isPasswordVisible.value,
                        enabled: !isLoading,
                        textInputAction: TextInputAction.done,
                        prefixIcon: Icons.lock_outline,
                        validator: (value) =>
                            (value == null || value.length < 3)
                            ? context.l10n.passwordTooShortError
                            : null,
                        onFieldSubmitted: (_) => onSubmit(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () => isPasswordVisible.value =
                              !isPasswordVisible.value,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  Consumer(
                    builder: (context, ref, child) {
                      final isLoading = ref
                          .watch(authControllerProvider)
                          .isLoading;
                      return FilledButton(
                        onPressed: isLoading ? null : onSubmit,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                                ),
                              ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
