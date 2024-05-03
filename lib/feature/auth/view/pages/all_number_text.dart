import 'package:wide/core/screens/all.dart';

class AllNumberTextField extends StatelessWidget {
  final TextEditingController? controller;
  const AllNumberTextField({super.key, this.controller});

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
              LengthLimitingTextInputFormatter(9),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 16))));
  }
}
