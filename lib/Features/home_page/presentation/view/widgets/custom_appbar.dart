import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/go_route.dart';
import '../../../../../core/utils/styles.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kAppName,textAlign: TextAlign.center,
            style: Styles.textStyle28.copyWith(
                fontFamily: GoogleFonts.eczar().fontFamily)
            ,),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              GoRouter.of(context).push(GoRouteClass.searchScreen);
            },icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
          ),
          )
        ],
      ),
    );
  }
}