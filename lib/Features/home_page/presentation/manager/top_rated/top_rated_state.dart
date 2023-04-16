part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {

  final List<Movie> movies;
  TopRatedLoaded({required this.movies});
}
class TopRatedLoading extends TopRatedState {}
class TopRatedError extends TopRatedState {

  final String error;
  TopRatedError({required this.error});
}
