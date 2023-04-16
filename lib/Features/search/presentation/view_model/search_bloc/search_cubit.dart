import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_era_app/Features/search/data/repos/search_repo.dart';

import '../../../../home_page/data/models/movie_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  void searchForMovie(String text)async{

    emit(SearchLoading());
    if(text.isEmpty){
      emit(SearchInitial());
    }else {
      final result = await searchRepo.searchForMovies(text);

      result.fold((fail) {
        emit(SearchError(error: fail.errMessage));
      }, (res) {
        emit(SearchLoaded(movies: res));
      });
    }
  }

}
