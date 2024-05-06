import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Yangi parol yarating",
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Center(
              child: InputTextField(
                controller: passwordController,
                name: "Yangi parol kiriting",
                showPasswordToggle: true,
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: InputTextField(
              controller: confirmController,
              name: "Parolni qayta kiriting",
              showPasswordToggle: true,
            )),
            const Spacer(),
            const Spacer(),
            ButtonBlue(
                width: double.infinity,
                color: AppColors.c1a73e8,
                height: 53,
                text: "Kirish",
                onPressed: () => context.go("/login")),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
