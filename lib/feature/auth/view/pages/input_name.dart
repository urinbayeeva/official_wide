import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
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
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Keyinchalik sizga bu nomni ozgartirish imkoniyati beriladi",
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Center(
              child: InputTextField(
                controller: userNameController,
                name: "ismingiz",
                showPasswordToggle: false,
              ),
            ),
            const Spacer(),
            ButtonBlue(
              width: double.infinity,
              color: AppColors.c1a73e8,
              height: 53,
              text: "Keyingisi",
              onPressed: () {
                context.goNamed("passInput");
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
