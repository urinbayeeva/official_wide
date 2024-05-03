import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide/core/screens/all.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 90),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: const TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontFamily: "Geometria"),
                          children: [
                            const TextSpan(text: "Agar ro'yhatdan o’tgan bo'lsangiz "),
                            TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () => context.go("/login"),
                                text: "kirish\n",
                                style: const TextStyle(
                                    color: AppColors.c1a73e8, fontWeight: FontWeight.bold, fontSize: 16)),
                            const TextSpan(text: "tugmasini bosing.")
                          ])),
                  const SizedBox(height: 40),
                  InputTextField(controller: nameController, name: "Ismingiz", showPasswordToggle: false),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                    NumberTextField(controller: phoneCodeController),
                    const SizedBox(width: 8),
                    Expanded(flex: 3, child: AllNumberTextField(controller: phoneNumberController))
                  ]),
                  const SizedBox(height: 40),
                  const DividerWidget(),
                  const SizedBox(height: 40),
                  Center(
                      child: customElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImages.googleIcon, width: 20, height: 20),
                              const SizedBox(width: 8),
                              const Text(
                                "Google akkaunt orqali ro'yhatdan o'tish",
                                style: TextStyle(color: AppColors.c1c1c1c, fontWeight: FontWeight.w600, fontSize: 14),
                              )
                            ],
                          ))),
                  const Spacer(),
                  ButtonBlue(
                      color: AppColors.c1a73e8,
                      width: double.infinity,
                      height: 53,
                      text: "Kirish",
                      onPressed: () => context.goNamed("inputName")),
                  const SizedBox(height: 40)
                ]))));
  }
}
