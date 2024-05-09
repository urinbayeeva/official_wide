import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/style/colors.dart';

class AllNumberTextField extends StatelessWidget {
  final TextEditingController? controller;
  const AllNumberTextField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 48,
      child: TextField(
        cursorColor: AppColors.c1a73e8,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          _CustomInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.c1a73e8, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cfcfdf0, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: InputBorder.none,
          hintText: "90 000 00 00",
          hintStyle: TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        ),
      ),
    );
  }
}

class _CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';

    if (newValue.text.length <= 9) {
      for (int i = 0; i < newValue.text.length; i++) {
        if (i == 2 || i == 5 || i == 7) {
          formattedText += ' ';
        }
        formattedText += newValue.text[i];
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
