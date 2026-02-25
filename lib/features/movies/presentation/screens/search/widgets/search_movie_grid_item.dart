import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class SearchMovieGridItem extends StatelessWidget {
  final Movie movie;

  const SearchMovieGridItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details/${movie.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster - fixed height để tránh overflow
          ClipRRect(
            borderRadius: context.radiusSm,
            child: SizedBox(
              height: 160, // Fixed height thay vì AspectRatio
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomNetworkImage(
                    imageUrl: movie.posterPath != null
                        ? '${AppConstants.imageUrl200}${movie.posterPath}'
                        : '',
                    borderRadius: 0,
                    fit: BoxFit.cover,
                  ),
                  // Rating badge
                  if (movie.voteAverage > 0)
                    Positioned(
                      top: SpacingTokens.xs,
                      left: SpacingTokens.xs,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: context.radiusXs,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.amber,
                            ),
                            context.gapXs,
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: context.labelSm.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Favorite button
                  Positioned(
                    top: SpacingTokens.xs,
                    right: SpacingTokens.xs,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: context.radiusLg,
                      ),
                      child: FavoriteButton(
                        movieId: movie.id,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          context.gapSm,
          // Title (max 2 lines)
          Expanded(
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bodySm.copyWith(
                color: context.textPrimary,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ),
          // Year - dùng textPrimary để dễ nhìn trên background
          if (movie.releaseDate.isNotEmpty)
            Text(
              movie.releaseDate.substring(0, 4),
              style: context.bodySm.copyWith(
                color: context.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
