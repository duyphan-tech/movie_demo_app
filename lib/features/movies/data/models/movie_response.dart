import 'movie_model.dart';

class MovieResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'] ?? 1,
      results: json['results'] != null
          ? (json['results'] as List)
                .map((e) => MovieModel.fromJson(e))
                .toList()
          : [],
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
