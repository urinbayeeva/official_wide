import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
              SizedBox(
                  height: screenSize.height *
                      0.1), // Adjusted height based on screen size
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.c1c1c1c,
                    fontSize: 16,
                    fontFamily: "Geometria",
                  ),
                  children: [
                    const TextSpan(text: "Agar ro'yhatdan o’tgan bo'lsangiz "),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.go("/login"),
                      text: "kirish\n",
                      style: const TextStyle(
                        color: AppColors.c1a73e8,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(text: "tugmasini bosing."),
                  ],
                ),
              ),
              SizedBox(
                  height: screenSize.height *
                      0.04), // Adjusted height based on screen size
              InputTextField(
                controller: nameController,
                name: "Ismingiz",
                showPasswordToggle: false,
              ),
              SizedBox(
                  height: screenSize.height *
                      0.02), // Adjusted height based on screen size
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumberTextField(),
                  SizedBox(
                      width: screenSize.width *
                          0.01), // Adjusted width based on screen size
                  Expanded(
                    flex: 3,
                    child: AllNumberTextField(
                      controller: phoneNumberController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: screenSize.height *
                      0.04), // Adjusted height based on screen size
              const DividerWidget(),
              SizedBox(
                  height: screenSize.height *
                      0.04), // Adjusted height based on screen size
              Center(
                child: customElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.googleIcon,
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                          width: screenSize.width *
                              0.01), // Adjusted width based on screen size
                      const Text(
                        "Google akkaunt orqali ro'yhatdan o'tish",
                        style: TextStyle(
                          color: AppColors.c1c1c1c,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ButtonBlue(
                color: AppColors.c1a73e8,
                width: double.infinity,
                height: 53,
                text: "Kirish",
                onPressed: () => context.goNamed("inputName"),
              ),
              SizedBox(height: screenSize.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
