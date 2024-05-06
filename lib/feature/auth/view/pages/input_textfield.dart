import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wide/core/screens/all.dart';

class InputTextField extends StatefulWidget {
  final String? name;
  final SvgPicture? icon;
  final TextEditingController? controller;
  final bool showPasswordToggle;
  final bool? showText;

  const InputTextField({
    Key? key,
    this.name,
    this.icon,
    this.controller,
    this.showPasswordToggle = true,
    this.showText,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = true;
  bool _showClearButton = false;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextField(
        cursorColor: AppColors.c1a73e8,
        obscureText: widget.showText != null && !widget.showText!,
        controller: widget.controller,
        onChanged: (text) {
          setState(() {
            _showClearButton = text.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      widget.controller!.clear();
                      _showClearButton = false;
                    });
                  },
                )
              : widget.showPasswordToggle
                  ? IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.c1a73e8, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cfcfdf0, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: InputBorder.none,
          hintText: widget.name,
          hintStyle: const TextStyle(color: Color(0xFFB7B7B7), fontSize: 16),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        ),
      ),
    );
  }
}
