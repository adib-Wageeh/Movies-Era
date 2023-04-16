import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_era_app/Features/home_page/presentation/manager/top_rated/top_rated_cubit.dart';
import 'Features/home_page/data/repos/home_repo_impl.dart';
import 'Features/home_page/presentation/manager/latest_movies_bloc/latest_movies_cubit.dart';
import 'Features/home_page/presentation/manager/upcoming_movies_bloc/upcoming_movies_cubit.dart';
import 'constants.dart';
import 'core/utils/go_route.dart';
import 'core/utils/service_locator.dart';

void main() {

  setupSingleton();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
     providers: [
      BlocProvider(create: (context)=>LatestMoviesCubit(homeRepo: getIt.get<HomeRepositoryImpl>())..getLatestMovies()),
       BlocProvider(create: (context)=>UpcomingMoviesCubit(homeRepo: getIt.get<HomeRepositoryImpl>())..getUpcomingMovies()),
      BlocProvider(create: (context) => TopRatedCubit(homeRepo: getIt.get<HomeRepositoryImpl>())..topRatedMovies(),)
     ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouteClass.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.eczarTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    )
  );
}

