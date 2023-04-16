import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class ListViewRowWidget extends StatelessWidget {

  final String title;
  final void Function()? ontap;
  const ListViewRowWidget({
    super.key,
    required this.title,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Styles.textStyle20,),
        const Spacer(),
        GestureDetector(child:
        ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
          child: const Text("See more",style: Styles.textStyle18),
        ),)
      ],
    );
  }
}