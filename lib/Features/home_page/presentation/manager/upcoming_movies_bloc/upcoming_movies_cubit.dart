import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repos/home_repo.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit({required this.homeRepo}) : super(UpcomingMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> getUpcomingMovies()async{

    emit(UpcomingMoviesLoading());

    var result = await homeRepo.fetchUpcomingMovies();

    result.fold((failure) {
      emit(UpcomingMoviesFailure(error: failure.errMessage));
    }, (movies) {
      emit(UpcomingMoviesLoaded(movies: movies));
    });

  }

}
