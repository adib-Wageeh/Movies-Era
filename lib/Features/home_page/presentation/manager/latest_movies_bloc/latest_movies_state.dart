part of 'latest_movies_cubit.dart';

@immutable
abstract class LatestMoviesState {}

class LatestMoviesInitial extends LatestMoviesState {}
class LatestMoviesLoading extends LatestMoviesState {}

class LatestMoviesLoaded extends LatestMoviesState {
  final List<Movie> movies;
  LatestMoviesLoaded({required this.movies});
}


class LatestMoviesFailure extends LatestMoviesState {
  final String error;
  LatestMoviesFailure({required this.error});
}