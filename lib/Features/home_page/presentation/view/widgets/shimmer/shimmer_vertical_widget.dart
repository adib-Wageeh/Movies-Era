import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVerticalWidget extends StatelessWidget {
  const ShimmerVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Shimmer.fromColors(
          baseColor: const Color(0xff428dff),
          highlightColor: Colors.blue.shade100,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 12,
                            color: Colors.blue,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                          ),
                          Container(
                            width: 60,
                            height: 12,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )));
    }
  }
