import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repos/home_repo.dart';
part 'latest_movies_state.dart';

class LatestMoviesCubit extends Cubit<LatestMoviesState> {
  LatestMoviesCubit({required this.homeRepo}) : super(LatestMoviesInitial());

  bool onSeeMoreTapped = false;
  final HomeRepo homeRepo;

  Future<void> getLatestMovies()async{

    emit(LatestMoviesLoading());

    var result = await homeRepo.fetchLatestMovies();

    result.fold((failure) {
      emit(LatestMoviesFailure(error: failure.errMessage));
    }, (movies) {
      emit(LatestMoviesLoaded(movies: movies));
    });

  }


}
