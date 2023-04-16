import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/movie_model.dart';

class ItemDataRow extends StatelessWidget {

  final Movie movie;
  const ItemDataRow({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,size: 14),
        const SizedBox(width: 4,),
        Text(movie.voteAverage.toString(),style: Styles.textStyle14.copyWith(fontSize: 14)),
        const SizedBox(width: 2,),
        Text("(${movie.voteCount})",style: Styles.textStyle16.copyWith(color: Colors.grey,fontSize: 12)),
      ],
    );
  }
}