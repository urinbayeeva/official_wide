import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllNumberTextField extends StatelessWidget {
  final TextEditingController? controller;
  const AllNumberTextField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCFCFD0), width: 1),
      ),
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          _CustomInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "90 000 00 00",
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
