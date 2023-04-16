part of 'similar_movies_cubit.dart';

@immutable
abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<Movie> movies;
  SimilarMoviesLoaded({required this.movies});
}

class SimilarMoviesError extends SimilarMoviesState {

  final String error;
  SimilarMoviesError({required this.error});
}
