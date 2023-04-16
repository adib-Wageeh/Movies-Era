import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/movie_model.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<Movie>>> fetchUpcomingMovies();
 Future<Either<Failure,List<Movie>>> fetchLatestMovies();
 Future<Either<Failure,List<Movie>>> fetchTopRatedMovies();
 Future<Either<Failure, List<Movie>>> fetchSimilarMovies(Movie movie);


}