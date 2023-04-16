import 'package:flutter/material.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/vertical_list_view_item.dart';
import '../../../data/models/movie_model.dart';


class VerticalListView extends StatelessWidget {


  final List<Movie> movies;
  const VerticalListView({required this.movies,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child:
                 ListView.builder(itemBuilder: (context, index) {
                  return VerticalListViewItem(
                    movie: movies[index]);
                },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                )

    );
  }
}
