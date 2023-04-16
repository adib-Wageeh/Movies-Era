import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/go_route.dart';
import '../../../data/models/movie_model.dart';
import 'list_view_item.dart';

class HorizontalListView extends StatelessWidget {
  final List<Movie> movies;

  const HorizontalListView({required this.movies, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ListViewItem(movie: movies[index], onTap: () {
              GoRouter.of(context).push(GoRouteClass.detailsScreen,
                  extra: movies[index]);
            },),
          );
        },
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
        )
    );
  }
}
