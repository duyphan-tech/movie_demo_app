import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final String status;
  final String? tagline;
  final int runtime;
  final int budget;
  final int revenue;
  final List<Genre> genres;

  const MovieDetail({
    required this.id,
    required this.title,
    this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.status,
    this.tagline,
    required this.runtime,
    required this.budget,
    required this.revenue,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    originalTitle,
    overview,
    posterPath,
    backdropPath,
    releaseDate,
    voteAverage,
    voteCount,
    status,
    tagline,
    runtime,
    budget,
    revenue,
    genres,
  ];
}
