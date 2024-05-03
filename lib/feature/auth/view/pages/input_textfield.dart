import 'package:wide/core/screens/all.dart';

class InputTextField extends StatefulWidget {
  final String? name;
  final SvgPicture? icon;
  final TextEditingController? controller;
  final bool showPasswordToggle;

  const InputTextField({
    super.key,
    this.name,
    this.icon,
    this.controller,
    this.showPasswordToggle = true, // Default to true
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFCFCFD0),
          width: 1,
        ),
      ),
      child: TextField(
        obscureText: !_passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.showPasswordToggle
              ? IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          hintText: widget.name,
          hintStyle: const TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
