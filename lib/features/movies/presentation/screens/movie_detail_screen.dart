import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie_detail.dart';
import '../providers/movie_detail_provider.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(movieDetailProvider(movieId));

    return Scaffold(
      body: asyncValue.when(
        data: (movie) => _buildBody(context, movie),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _buildBody(BuildContext context, MovieDetail movie) {
    const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                shadows: [Shadow(color: Colors.black, blurRadius: 10)],
              ),
            ),
            background: movie.backdropPath != null
                ? Image.network(
                    '$imageBaseUrl${movie.backdropPath}',
                    fit: BoxFit.cover,
                  )
                : Container(color: Colors.grey),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (movie.tagline != null && movie.tagline!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      '"${movie.tagline}"',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${movie.voteAverage.toStringAsFixed(1)}/10',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${movie.runtime} phút'),
                    const SizedBox(width: 16),
                    Chip(
                      label: Text(movie.status),
                      backgroundColor: Colors.blue.shade50,
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text(
                  "Thể loại",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: movie.genres.map((genre) {
                    return Chip(label: Text(genre.name));
                  }).toList(),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Nội dung",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),

                const SizedBox(height: 24),
                _buildInfoRow("Ngân sách", "\$${movie.budget}"),
                _buildInfoRow("Doanh thu", "\$${movie.revenue}"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
