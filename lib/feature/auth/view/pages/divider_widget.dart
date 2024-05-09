import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide/core/screens/all.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Expanded(
          child: Container(
        height: 0.2,
        color: AppColors.c707071,
      )),
      Text("\t\t\tyoki\t\t\t",
          style: TextStyle(
              color: AppColors.c707071,
              fontSize: 14,
              fontWeight: FontWeight.w400)),
      Expanded(
          child: Container(
        height: 0.2,
        color: AppColors.c707071,
      ))
    ]);
  }
}
