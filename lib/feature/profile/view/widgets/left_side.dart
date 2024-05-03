import 'package:flutter/material.dart';
import 'package:wide/feature/home/view/widgets/rotated_widget.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Image.asset("assets/images/home/logo.png", width: 50, height: 40),
      const SizedBox(height: 40),
      Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(width: 1, color: Color(0xFFEFEFEF))),
          ),
          child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 19),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                RotatedWidget(imagePath: "assets/icons/home/plus.svg"),
                SizedBox(height: 12, width: 200),
                RotatedWidget(imagePath: "assets/icons/tab_bar/profile_icon.svg"),
                SizedBox(height: 12),
                RotatedWidget(imagePath: "assets/icons/tab_bar/search_icon.svg"),
                SizedBox(height: 12),
                RotatedWidget(imagePath: "assets/icons/tab_bar/home_icon.svg")
              ])))
    ]));
  }
}
