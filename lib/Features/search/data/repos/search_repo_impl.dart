import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import 'package:movies_era_app/Features/search/data/repos/search_repo.dart';
import 'package:movies_era_app/core/errors/failure.dart';
import '../../../../core/utils/api_services.dart';

class SearchRepoImpl implements SearchRepo{

  final ApiServices apiServices;
  SearchRepoImpl({required this.apiServices});
  final String _start = "search/movie?query=";

  @override
  Future<Either<Failure, List<Movie>>> searchForMovies(String text) async{

    try {
      final respond = await apiServices.get(endPoint: "$_start$text&");

      List<Movie> movies = [];

      for(var item in respond["results"]){
        movies.add(Movie.fromJson(item));
      }
      return(Right(movies));
    }catch(e){
      if(e is DioError) {
        return (Left(ServerFailure.fromDioError(e)));
      }
      return(Left(ServerFailure(e.toString())));
    }
  }
}