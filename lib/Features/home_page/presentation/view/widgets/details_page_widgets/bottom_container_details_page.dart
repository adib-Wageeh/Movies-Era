import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../horizontal_listview_details_page.dart';

class DetailsPageBottomContainer extends StatelessWidget {
  const DetailsPageBottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 24,bottom: 8),
            child: const Text("You Can Also Like",style: Styles.textStyle14,)),
        const SizedBox(
            height: 150,
            child: Padding(
              padding: EdgeInsets.only(left:20),
              child: HorizontalListViewDetailsPage(),
            ))
      ],
    );
  }
}