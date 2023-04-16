import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import '../../../../../../core/utils/styles.dart';

class DetailsPageItemName extends StatelessWidget {

  final Movie movie;
  const DetailsPageItemName({required this.movie,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(movie.originalTitle.toString(),style: Styles.textStyle30.copyWith(
              fontFamily: GoogleFonts.goudyBookletter1911TextTheme.toString(),
              fontWeight: FontWeight.w600
          ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 4,),

      ],
    );
  }
}