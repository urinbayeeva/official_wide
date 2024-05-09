import 'package:flutter/material.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required Widget child,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      fixedSize:
          MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFCFCFD0), width: 1),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      elevation: MaterialStateProperty.all<double>(0),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey.withOpacity(0.1);
          }
          return null;
        },
      ),
    ),
    child: child,
  );
}
