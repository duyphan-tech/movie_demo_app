import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BaseMovieListScreen extends HookConsumerWidget {
  final String title;
  final ProviderListenable<AsyncValue<List<Movie>>> provider;
  final Widget Function(BuildContext, Movie) itemBuilder;
  final IconData emptyIcon;
  final String emptyMessage;
  final double childAspectRatio;

  const BaseMovieListScreen({
    super.key,
    required this.title,
    required this.provider,
    required this.itemBuilder,
    this.emptyIcon = Icons.movie_creation_outlined,
    required this.emptyMessage,
    this.childAspectRatio = 0.7,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);

    ref.listen(provider, (previous, next) {
      final nextAsync = next;
      if (nextAsync.hasError && !nextAsync.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.error}: ${nextAsync.error}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: asyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                context.l10n.dataLoadError,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(emptyIcon, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    emptyMessage,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) =>
                itemBuilder(context, movies[index]),
          );
        },
      ),
    );
  }
}
