import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;

  const ButtonBlue({
    super.key,
    this.width,
    this.height,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color ?? Colors.blue),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text ?? '',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
