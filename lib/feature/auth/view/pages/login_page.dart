import 'package:wide/core/screens/all.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(AppImages.authLogo),
                const SizedBox(
                  height: 104,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InputTextField(
                      name: "User Ismingiz yoki telefon raqamingiz",
                      controller: loginController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      name: "Parolingiz",
                      controller: passwordController,
                      showPasswordToggle: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => context.go("/loginInputNumber"),
                      child: const Text(
                        "Parolni unutdingizmi ?",
                        style: TextStyle(
                          color: AppColors.c1a73e8,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const RoyhatdanOtishWidget(
                  text: "Ro'yxatdan o'tish",
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonBlue(
                  width: double.infinity,
                  color: loginController.text.isNotEmpty ? AppColors.c1a73e8 : AppColors.c1a73e8,
                  height: 53,
                  text: "Kirish",
                  onPressed: () {
                    context.go("/homePage");
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
