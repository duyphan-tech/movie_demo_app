import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final double voteAverage;
  final double rating;
  final int voteCount;
  final double popularity;
  final bool isAdult;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.rating,
    required this.voteCount,
    required this.popularity,
    required this.isAdult,
    required this.genreIds,
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
    popularity,
    isAdult,
    genreIds,
    rating,
  ];
}

class HomeState {
  final List<Movie> nowPlaying;
  final List<Movie> topRated;
  final List<Movie> upcoming;
  final List<Movie> popular;

  HomeState({
    required this.nowPlaying,
    required this.topRated,
    required this.upcoming,
    required this.popular,
  });

  HomeState copyWith({
    List<Movie>? nowPlaying,
    List<Movie>? topRated,
    List<Movie>? upcoming,
    List<Movie>? popular,
  }) {
    return HomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
      popular: popular ?? this.popular,
    );
  }
}
