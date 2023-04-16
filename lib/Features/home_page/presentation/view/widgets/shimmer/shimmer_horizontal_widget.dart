import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../constants.dart';

class ShimmerHorizontalWidget extends StatelessWidget {
  const ShimmerHorizontalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: 120,
              height: 100,
              decoration: const BoxDecoration(
              ),
              child: Shimmer.fromColors(
                  baseColor: kPrimaryColor,
                  highlightColor: Colors.white,
                  child: const Center(child: CircularProgressIndicator(color: Colors.white,))),
            ),
          )),
    );
  }
}
