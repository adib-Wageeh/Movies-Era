import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repos/home_repo.dart';
part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit({required this.homeRepo}) : super(SimilarMoviesInitial());
  HomeRepo homeRepo;

  void getSimilarMovies(Movie movie)
  async{

    emit(SimilarMoviesLoading());
    var result = await homeRepo.fetchSimilarMovies(movie);

    result.fold((failure){
      emit(SimilarMoviesError(error: failure.errMessage));
    }, (movies){
      emit(SimilarMoviesLoaded(movies: movies));
    });


  }

}
