import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_services.dart';
import '../models/movie_model.dart';
import 'home_repo.dart';


class HomeRepositoryImpl implements HomeRepo{

  final ApiServices apiService;

  HomeRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, List<Movie>>> fetchLatestMovies() async{

    try {
      var response = await apiService.get(endPoint: "movie/now_playing?");

      List<Movie> movies =[];

      for(var item in response["results"] ){

        movies.add(Movie.fromJson(item));
      }
      return Right(movies);
    }catch(e){
      if(e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> fetchUpcomingMovies() async{

    try{
    final response =await apiService.get(endPoint: "movie/upcoming?");

    List<Movie> movies =[];

    for(var item in response["results"] ){

      movies.add(Movie.fromJson(item));
    }
    return Right(movies);
  }catch(e){
      if(e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
  }


  }

  @override
  Future<Either<Failure, List<Movie>>> fetchSimilarMovies(Movie movie) async{

    try{
   final response = await apiService.get(endPoint: "movie/${movie.id}/similar?");
   List<Movie> movies =[];

   for(var item in response["results"] ){

     movies.add(Movie.fromJson(item));
   }
   return Right(movies);
  }catch(e){
  if(e is DioError) {
  return Left(ServerFailure.fromDioError(e));
  }
  return Left(ServerFailure(e.toString()));
  }


  }

  @override
  Future<Either<Failure, List<Movie>>> fetchTopRatedMovies() async{

    try{
      final response = await apiService.get(endPoint: "movie/top_rated?");
      List<Movie> movies =[];

      for(var item in response["results"] ){

        movies.add(Movie.fromJson(item));
      }
      return Right(movies);
    }catch(e){
      if(e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }

  }



}