import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/review_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/reviews_list.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/user_rating_card.dart';

class MovieReviewsSection extends StatelessWidget {
  final int movieId;
  const MovieReviewsSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [currentMovieIdProvider.overrideWithValue(movieId)],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ReviewHeader(), UserRatingCard(), ReviewsList()],
      ),
    );
  }
}
