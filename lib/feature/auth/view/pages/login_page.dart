import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              SvgPicture.asset(AppImages.authLogo),
              SizedBox(height: screenHeight * 0.15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputTextField(
                    name: "User Ismingiz yoki telefon raqamingiz",
                    controller: loginController,
                    showPasswordToggle: false,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  InputTextField(
                    name: "Parolingiz",
                    controller: passwordController,
                    showPasswordToggle: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () => context.go("/loginInputNumber"),
                    child: Text(
                      "Parolni unutdingizmi ?",
                      style: TextStyle(
                        color: AppColors.c1a73e8,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              RoyhatdanOtishWidget(
                text: "Ro'yxatdan o'tish",
              ),
              SizedBox(height: screenHeight * 0.03),
              ButtonBlue(
                width: double.infinity,
                color: loginController.text.isNotEmpty
                    ? AppColors.c1a73e8
                    : AppColors.c1a73e8,
                height: screenHeight * 0.07,
                text: "Kirish",
                onPressed: () {
                  context.go("/homePage");
                },
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
