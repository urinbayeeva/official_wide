import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/style/colors.dart';

class AllNumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  const AllNumberTextField({Key? key, this.controller}) : super(key: key);

  @override
  _AllNumberTextFieldState createState() => _AllNumberTextFieldState();
}

class _AllNumberTextFieldState extends State<AllNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 48,
      child: TextField(
        cursorColor: AppColors.c1a73e8,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _PhoneNumberFormatter(),
          LengthLimitingTextInputFormatter(12),
        ],
        keyboardType: TextInputType.number,
        controller: widget.controller,
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
          hintStyle: const TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 15,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          suffixIcon:
              widget.controller != null && widget.controller!.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          widget.controller!.clear();
                        });
                      },
                    )
                  : null,
        ),
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var newText = '';
    for (int i = 0; i < text.length; i++) {
      newText += text[i];
      if (i == 1 || i == 4 || i == 6) {
        newText += ' ';
      }
    }

    return newValue.copyWith(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
