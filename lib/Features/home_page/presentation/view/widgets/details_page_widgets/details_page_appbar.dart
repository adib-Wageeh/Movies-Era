import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPageAppBar extends StatelessWidget {
  const DetailsPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}