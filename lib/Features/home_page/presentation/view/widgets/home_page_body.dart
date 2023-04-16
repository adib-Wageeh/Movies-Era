import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_era_app/Features/home_page/presentation/manager/top_rated/top_rated_cubit.dart';
import 'package:movies_era_app/Features/home_page/presentation/manager/upcoming_movies_bloc/upcoming_movies_cubit.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/shimmer/shimmer_horizontal_widget.dart';
import '../../manager/latest_movies_bloc/latest_movies_cubit.dart';
import 'custom_appbar.dart';
import 'horizontal_list_view.dart';
import 'list_view_row_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomePageAppBar(),
                Expanded(child: BlocConsumer<LatestMoviesCubit,
                    LatestMoviesState>(
                  listener: (context, state) {


                  },
                  builder: (context, state) {
                    if (state is LatestMoviesLoaded) {
                    return Column(children: [
                      ListViewRowWidget(title: "Latest Movies", ontap: () {
                      }),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                                child: HorizontalListView(movies: state.movies)
                    )]);
                              }else
                              if (state is LatestMoviesFailure) {
                                ErrorBox(error: state.error, onPressed: () {},);
                              }
                              return const ShimmerHorizontalWidget();
                            }

                        ),
                      ),
                ListViewRowWidget(title: "Upcoming Movies", ontap: () {}),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                  child: BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
                      builder: (context, state) {
                        if (state is UpcomingMoviesLoaded) {
                          return HorizontalListView(movies: state.movies);
                        }
                        if (state is UpcomingMoviesFailure) {
                          ErrorBox(error: state.error, onPressed: () {},);
                        }
                        return const ShimmerHorizontalWidget();
                      }

                  ),
                ),
                ListViewRowWidget(title: "Top Rated Movies", ontap: () {}),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                  child: BlocBuilder<TopRatedCubit, TopRatedState>(
                      builder: (context, state) {
                        if (state is TopRatedLoaded) {
                          return HorizontalListView(movies: state.movies);
                        }
                        if (state is TopRatedError) {
                          ErrorBox(error: state.error, onPressed: () {},);
                        }
                        return const ShimmerHorizontalWidget();
                      }

                  ),
                ),
              ],
            )

        )
      ],

    );

  }
}


class ErrorBox extends StatelessWidget {
  final String error;
  final void Function()? onPressed;

  const ErrorBox({required this.onPressed, required this.error, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error),
      content: ElevatedButton(
        onPressed: onPressed, child: const Text("Try Again"),
      ),
    );
  }
}