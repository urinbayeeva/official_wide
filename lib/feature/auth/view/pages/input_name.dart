import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController userNameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 104,
            ),
            const Text(
              "Foydalanish ismingizni tanlang ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Text(
              textAlign: TextAlign.center,
              "Keyinchalik sizga bu nomni ozgartirish\nimkoniyati beriladi",
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InputTextField(
              controller: userNameController,
              name: "ismingiz",
              showPasswordToggle: false,
            ),
            const Spacer(),
            const RoyhatdanOtishWidget(
              text: "Kirish",
            ),
            SizedBox(height: screenHeight * 0.03),
            ButtonBlue(
              width: double.infinity,
              color: userNameController.text.isNotEmpty
                  ? AppColors.c1a73e8
                  : AppColors.c1a73e8,
              height: 48,
              text: "Keyingisi",
              onPressed: () {
                context.go("/inputPass");
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
