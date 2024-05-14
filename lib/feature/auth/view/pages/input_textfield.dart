import 'package:flutter/services.dart';
import 'package:wide/core/screens/all.dart';

class InputTextField extends StatefulWidget {
  final String? name;
  final SvgPicture? icon;
  final TextEditingController? controller;
  final bool showPasswordToggle;
  final bool? showText;

  const InputTextField({
    super.key,
    this.name,
    this.icon,
    this.controller,
    this.showPasswordToggle = true,
    this.showText,
  });

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
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.text,
        cursorColor: AppColors.c1a73e8,
        obscureText: widget.showText != null && !widget.showText!,
        controller: widget.controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(28),
        ],
        // onChanged: (text) {
        //   setState(() {
        //     if (text.length <= 28) {
        //       _showClearButton = text.isNotEmpty;
        //     } else {
        //       widget.controller!.text = text.substring(0, 28);

        //       widget.controller!.selection = TextSelection.collapsed(
        //           offset: widget.controller!.text.length);
        //       return;
        //     }
        //   });
        // },

        decoration: InputDecoration(
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      widget.controller!.clear();
                      _showClearButton = false;
                    });
                  },
                )
              : (widget.showPasswordToggle &&
                      !(_passwordVisible && widget.controller!.text.isNotEmpty))
                  ? GestureDetector(
                      child: Image.asset(
                        _passwordVisible
                            ? "assets/images/eye_open.png"
                            : "assets/images/eye_closed.png",
                        scale: 4.5,
                      ),
                      onTap: () {
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
          hintStyle: const TextStyle(color: Color(0xFFB7B7B7), fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        ),
      ),
    );
  }
}
