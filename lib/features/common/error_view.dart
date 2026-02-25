import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRetry(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: context.colorError,
                    ),
                    context.gapLg,
                    Text(
                      context.l10n.error,
                      style: context.bodyMd.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: onRetry,
                      child: Text(context.l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
