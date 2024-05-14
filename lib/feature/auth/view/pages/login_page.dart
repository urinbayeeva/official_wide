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

    bool isTapped = false;
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    if (loginController.text.isNotEmpty) {
      isTapped = true;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(AppImages.authLogo),
            Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              InputTextField(
                  name: "User Ismingiz yoki telefon raqam",
                  controller: loginController,
                  showPasswordToggle: false),
              const SizedBox(height: 16),
              InputTextField(
                  name: "Parolingiz",
                  controller: passwordController,
                  showPasswordToggle: true),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginInputNumber())),
                  child: const Text("Parolni unutdingizmi ?",
                      style: TextStyle(color: AppColors.c1a73e8, fontSize: 14)))
            ]),
            const Spacer(),
            const RoyhatdanOtishWidget(text: "Ro'yxatdan o'tish"),
            SizedBox(height: screenHeight * 0.03),
            ButtonBlue(
                width: double.infinity,
                color: loginController.text.isNotEmpty
                    ? AppColors.c1a73e8
                    : const Color(0xFFFBCF7A),
                height: 48,
                text: "Kirish",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
