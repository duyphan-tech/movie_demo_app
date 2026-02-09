import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({super.key, required this.review});

  ImageProvider? _getAvatarImage() {
    final path = review.authorDetails?.avatarPath;
    if (path == null || path.isEmpty) return null;

    if (path.startsWith('http')) {
      return NetworkImage(path);
    }
    return NetworkImage('${AppConstants.imageUrl200}$path');
  }

  @override
  Widget build(BuildContext context) {
    final avatarImage = _getAvatarImage();
    final initial = (review.author?.isNotEmpty == true)
        ? review.author![0].toUpperCase()
        : '?';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.indigo.shade100,
                backgroundImage: avatarImage,
                child: avatarImage == null
                    ? Text(
                        initial,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author ?? context.l10n.anonymous,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      review.createdAt?.split('T')[0] ?? '',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              if (review.authorDetails?.rating != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${review.authorDetails?.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.content ?? '',
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black87,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
