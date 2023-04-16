import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets_class.dart';
import '../../../../../../core/utils/styles.dart';

class CustomSplitButton extends StatelessWidget {
  const CustomSplitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 45,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16))
              ,color: Assets.kButtonSplitColor1
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
              splashColor: Colors.blue,
              child: Center(child: Text("19.99€",style: Styles.textStyle18.copyWith(
                  color: Colors.black
              ),)),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 45,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),topRight: Radius.circular(16)),
              color:Assets.kButtonSplitColor2
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16),topRight: Radius.circular(16)),
              splashColor: Colors.blue,
              child: Center(child: Text("Free Preview",style: Styles.textStyle16.copyWith(
                  color: Colors.white
              ),)),
            ),
          ),
        )
      ],
    );
  }
}