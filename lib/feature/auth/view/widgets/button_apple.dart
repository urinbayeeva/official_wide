import 'package:flutter/material.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required Widget child,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 50)),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFCFCFD0), width: 1),
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.grey.withOpacity(0.1);
          }
          return null;
        },
      ),
    ),
    child: child,
  );
}
