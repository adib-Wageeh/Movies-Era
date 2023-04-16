import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets_class.dart';
import '../../../../../core/utils/go_route.dart';
import '../../../../../core/utils/styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    slideAnimation();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo,width: 100,height: 100),
        const SizedBox(height: 6,),
        SlideTransition(
            position: animation,
            child: Text(kAppName,textAlign: TextAlign.center,
              style: Styles.textStyle28.copyWith(
                  fontFamily: GoogleFonts.eczar().fontFamily)
              ,))
      ],
    );
  }

  void slideAnimation() {
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    animation = Tween<Offset>(begin: const Offset(0, 2),end: Offset.zero).animate(animationController);
    animationController.forward();
    animation.addListener(() {
      setState(() {

      });
    });
  }

  void navigateToHome(){
    Future.delayed(const Duration(seconds: 2),() {
      GoRouter.of(context).push(GoRouteClass.homeScreen);
    },);
  }
}
