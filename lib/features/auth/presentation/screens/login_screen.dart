import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../providers/auth_controller.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController(
      text: kDebugMode ? 'eve.holt@reqres.in' : '',
    );

    final TextEditingController passwordController = useTextEditingController(
      text: kDebugMode ? 'cityslicka' : '',
    );

    final ValueNotifier<bool> isPasswordVisible = useState(false);

    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    void onLogin() {
      if (formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        ref
            .read(authControllerProvider.notifier)
            .login(emailController.text.trim(), passwordController.text.trim());
      }
    }

    void onRegister() {
      if (formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        ref
            .read(authControllerProvider.notifier)
            .register(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
      }
    }

    ref.listen<AsyncValue<bool>>(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.error.toString().replaceAll('Exception: ', ''),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
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
                const SizedBox(height: 16),
                const Text(
                  'Movies Demo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),

                const SizedBox(height: 40),

                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: 'example@gmail.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Email';
                    }
                    if (!value.contains('@')) return 'Email không hợp lệ';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  controller: passwordController,
                  label: 'Mật khẩu',
                  prefixIcon: Icons.lock_outline,
                  textInputAction: TextInputAction.done,
                  enabled: !isLoading,

                  obscureText: !isPasswordVisible.value,

                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Vui lòng nhập mật khẩu';
                    if (value.length < 6) return 'Mật khẩu phải hơn 6 ký tự';
                    return null;
                  },
                  onFieldSubmitted: (_) => onLogin(),
                ),
                const SizedBox(height: 24),

                FilledButton(
                  onPressed: isLoading ? null : onLogin,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.indigo,
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
                      : const Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
