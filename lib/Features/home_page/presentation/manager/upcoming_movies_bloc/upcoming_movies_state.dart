part of 'upcoming_movies_cubit.dart';

@immutable
abstract class UpcomingMoviesState {}

class UpcomingMoviesInitial extends UpcomingMoviesState {}
class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<Movie> movies;
  UpcomingMoviesLoaded({required this.movies});
}


class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String error;
  UpcomingMoviesFailure({required this.error});
}

