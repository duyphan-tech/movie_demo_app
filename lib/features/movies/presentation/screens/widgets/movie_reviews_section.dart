import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/review_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/reviews_list.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/user_rating_card.dart';

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

// class MovieReviewsSection extends ConsumerWidget {
//   final int movieId;
//   const MovieReviewsSection({super.key, required this.movieId});

//   void _showRatingDialog(
//     BuildContext context,
//     WidgetRef ref,
//     double? initialRating,
//   ) {
//     double currentRating = initialRating ?? 5.0;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text('Đánh giá phim'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     '${currentRating.toStringAsFixed(1)} / 10',
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.amber,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Slider(
//                     value: currentRating,
//                     min: 1.0,
//                     max: 10.0,
//                     divisions: 18,
//                     label: currentRating.toString(),
//                     activeColor: Colors.amber,
//                     onChanged: (value) {
//                       setState(() => currentRating = value);
//                     },
//                   ),
//                 ],
//               ),
//               actions: [
//                 if (initialRating != null)
//                   TextButton(
//                     onPressed: () async {
//                       Navigator.pop(context);

//                       ref
//                           .read(movieAccountStateProvider(movieId).notifier)
//                           .deleteLocalRating();

//                       final result = await ref
//                           .read(movieRepositoryProvider)
//                           .deleteRating(movieId: movieId);

//                       if (context.mounted) {
//                         result.fold(
//                           (error) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Lỗi xóa: ${error.message}'),
//                               ),
//                             );
//                             ref.invalidate(movieAccountStateProvider(movieId));
//                           },
//                           (success) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text('Đã xóa đánh giá!')),
//                             );
//                           },
//                         );
//                       }
//                     },
//                     style: TextButton.styleFrom(foregroundColor: Colors.red),
//                     child: const Text('Xóa'),
//                   ),

//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text(
//                     'Hủy',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),

//                 TextButton(
//                   onPressed: () async {
//                     Navigator.pop(context);

//                     ref
//                         .read(movieAccountStateProvider(movieId).notifier)
//                         .setLocalRating(currentRating);

//                     final result = await ref
//                         .read(movieRepositoryProvider)
//                         .rateMovie(movieId: movieId, value: currentRating);
//                   },
//                   child: const Text(
//                     'Gửi',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final reviewsAsync = ref.watch(reviewProvider(movieId));

//     final accountStateAsync = ref.watch(movieAccountStateProvider(movieId));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Đánh giá',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF110E47),
//                 ),
//               ),

//               IconButton(
//                 icon: const Icon(Icons.refresh, size: 20, color: Colors.grey),
//                 onPressed: () {
//                   ref.read(reviewProvider(movieId).notifier).refresh();
//                   ref.refresh(movieAccountStateProvider(movieId));
//                 },
//               ),
//             ],
//           ),
//         ),

//         accountStateAsync.when(
//           loading: () => const SizedBox.shrink(),
//           error: (_, __) => const SizedBox.shrink(),
//           data: (state) {
//             final myRating = state.rating;
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.amber.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.amber.withOpacity(0.3)),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.amber, size: 28),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           myRating != null
//                               ? "Bạn đã đánh giá"
//                               : "Chưa đánh giá",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF110E47),
//                           ),
//                         ),
//                         if (myRating != null)
//                           Text(
//                             "${myRating.toStringAsFixed(1)}/10",
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.amber,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => _showRatingDialog(context, ref, myRating),
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.amber,
//                     ),
//                     child: Text(myRating != null ? "Sửa" : "Chấm điểm"),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),

//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text(
//             "Cộng đồng",
//             style: TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//         ),

//         _buildList(reviewsAsync),
//       ],
//     );
//   }

//   Widget _buildList(AsyncValue<List<Review>> reviewsAsync) {
//     return reviewsAsync.when(
//       loading: () => const Center(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: CircularProgressIndicator(),
//         ),
//       ),
//       error: (error, stack) => Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'Lỗi tải đánh giá: $error',
//           style: const TextStyle(color: Colors.red),
//         ),
//       ),
//       data: (reviews) {
//         if (reviews.isEmpty) {
//           return const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Chưa có đánh giá nào. Hãy là người đầu tiên!",
//               style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
//             ),
//           );
//         }

//         return ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           itemCount: reviews.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 16),
//           itemBuilder: (context, index) {
//             final review = reviews[index];
//             return ReviewItem(review: review);
//           },
//         );
//       },
//     );
//   }
// }
