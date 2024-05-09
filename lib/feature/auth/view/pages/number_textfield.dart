import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: "+998");
  NumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 48,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.cfcfdf0)),
      child: const Center(
        child: Text(
          "+998",
          style: TextStyle(
              color: AppColors.c1c1c1c,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
