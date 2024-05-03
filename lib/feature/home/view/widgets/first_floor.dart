import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wide/core/screens/all.dart';

class FirstFloor extends StatelessWidget {
  const FirstFloor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/home/cancel.svg"),
        ),
        SizedBox(
          width: 250,
          height: 80,
          child: SearchTextField(),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/home/circle_plus.png", width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/home/circle_share.png", width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/home/cirle_link.png", width: 24, height: 24),
            ),
            Container(
              width: 1, // Adjusted width
              height: 92,
              color: const Color(0xFFEFEFEF),
              child: SvgPicture.asset("assets/icons/home/top.svg"),
            ),
          ],
        ),
      ],
    );
  }
}
