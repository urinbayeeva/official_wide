import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController? controller;
  const NumberTextField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFCFCFD0),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(3),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "+998",
          hintStyle: TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
