import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Expanded(
        child: SizedBox(
            width: 140, height: 0, child: Divider(color: AppColors.cfcfdf0, thickness: 0.5, endIndent: 10, indent: 10)),
      ),
      SizedBox(width: 21),
      Text("yoki", style: TextStyle(color: AppColors.c707071, fontSize: 16, fontWeight: FontWeight.w400)),
      SizedBox(width: 21),
      Expanded(
        child: SizedBox(
            width: 140, height: 0, child: Divider(color: AppColors.cfcfdf0, thickness: 0.5, endIndent: 10, indent: 10)),
      )
    ]);
  }
}
