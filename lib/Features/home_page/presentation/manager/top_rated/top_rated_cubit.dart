import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repos/home_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit({required this.homeRepo}) : super(TopRatedInitial());

  HomeRepo homeRepo;

  void topRatedMovies()
  async{

    emit(TopRatedLoading());
    var result = await homeRepo.fetchTopRatedMovies();

    result.fold((failure){
      emit(TopRatedError(error: failure.errMessage));
    }, (movies){
      emit(TopRatedLoaded(movies: movies));
    });


  }
}
