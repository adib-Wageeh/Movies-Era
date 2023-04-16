import 'package:dartz/dartz.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo{

  Future<Either<Failure,List<Movie>>> searchForMovies(String text);


}