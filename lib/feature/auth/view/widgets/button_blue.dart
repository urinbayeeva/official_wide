import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;

  const ButtonBlue({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ?? Colors.blue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text ?? '',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
