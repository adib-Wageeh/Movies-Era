import 'package:flutter/material.dart';
import '../../../../data/models/movie_model.dart';
import '../list_view_item.dart';

class DetailsPageImage extends StatelessWidget {

  final Movie movie;
  const DetailsPageImage({
    super.key,
    required this.movie
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.27,vertical: 8),
      child: SizedBox(
          child: ListViewItem(movie: movie,onTap: (){})),
    );
  }
}