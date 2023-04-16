import 'package:flutter/material.dart';
import 'package:movies_era_app/Features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child:
      SearchViewProvider()
      ),
    );
  }
}
