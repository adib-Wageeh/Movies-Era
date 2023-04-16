import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import '../../Features/home_page/presentation/view/home_page.dart';
import '../../Features/home_page/presentation/view/item_details_page.dart';
import '../../Features/search/presentation/view/search_view.dart';
import '../../Features/splash_screen/presentation/view/splash_view.dart';

abstract class GoRouteClass{

  static const homeScreen = "/HomeScreen";
  static const detailsScreen = "/detailsScreen";
  static const searchScreen = "/searchScreen";
  static const seeMoreScreen = "/seeMoreScreen";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: detailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          Movie movie = state.extra as Movie;
          return ItemDetailsPage(movie: movie);
        },
      ),
      GoRoute(
        path: searchScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );


}