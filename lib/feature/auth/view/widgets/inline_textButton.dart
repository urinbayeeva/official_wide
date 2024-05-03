import 'package:wide/core/screens/all.dart';

class InlineTextButton extends StatelessWidget {
  final String text;
  final Function? function;

  const InlineTextButton({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(),
      onPressed: function as void Function()?,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.c1a73e8, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
