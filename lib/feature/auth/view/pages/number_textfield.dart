import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: "+998");
  NumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 56,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.cfcfdf0)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Text(
          "+998",
          style: TextStyle(
              color: AppColors.c1c1c1c,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
