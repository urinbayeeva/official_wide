import 'package:wide/core/screens/all.dart';

class RoyhatdanOtishWidget extends StatelessWidget {
  final String? text;
  const RoyhatdanOtishWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegistrationPage())),
        child: Text(text!,
            style: const TextStyle(
                color: AppColors.c1a73e8,
                fontSize: 14,
                fontWeight: FontWeight.w500)));
  }
}
