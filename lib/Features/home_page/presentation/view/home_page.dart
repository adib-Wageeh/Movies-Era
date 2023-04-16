import 'package:flutter/material.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomePageBody(),
      ),
    );
  }
}
