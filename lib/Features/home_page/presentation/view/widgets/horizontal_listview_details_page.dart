import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_era_app/Features/home_page/presentation/manager/simular_movies_bloc/similar_movies_cubit.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/shimmer/shimmer_horizontal_widget.dart';
import '../../../../../core/utils/go_route.dart';
import 'list_view_item.dart';

class HorizontalListViewDetailsPage extends StatelessWidget {

  const HorizontalListViewDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
  builder: (context, state) {

    if(state is SimilarMoviesLoaded) {
      return SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 8),
            child: ListViewItem(
                movie: state.movies[index]
                , onTap: () {
              GoRouter.of(context).push(GoRouteClass.detailsScreen,
              extra: state.movies[index]
              );
            }
            ),
          );
        },
          scrollDirection: Axis.horizontal,
          itemCount: state.movies.length,
        ),
      );
    }
    return const ShimmerHorizontalWidget();

  },
);  }
}