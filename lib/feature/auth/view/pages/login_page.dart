import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.20),
            SvgPicture.asset(AppImages.authLogo),
            SizedBox(height: screenHeight * 0.15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InputTextField(
                  name: "User Ismingiz yoki telefon raqam",
                  controller: loginController,
                  showPasswordToggle: false,
                ),
                const SizedBox(height: 16),
                InputTextField(
                  name: "Parolingiz",
                  controller: passwordController,
                  showPasswordToggle: true,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => context.go("/loginInputNumber"),
                  child: const Text(
                    "Parolni unutdingizmi ?",
                    style: TextStyle(
                      color: AppColors.c1a73e8,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const RoyhatdanOtishWidget(
              text: "Ro'yxatdan o'tish",
            ),
            SizedBox(height: screenHeight * 0.03),
            ButtonBlue(
              width: double.infinity,
              color: loginController.text.isNotEmpty
                  ? AppColors.c1a73e8
                  : AppColors.c1a73e8,
              height: 48,
              text: "Kirish",
              onPressed: () {
                context.go("/homePage");
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
