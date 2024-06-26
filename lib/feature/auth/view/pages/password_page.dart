import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/core/services/network_service.dart';
import 'package:wide/data/entity/auth_model/registration_model.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordVisible = false;
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String? validatePassword(String? value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and digits"
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final RegistrationModel regisModel =
        ModalRoute.of(context)!.settings.arguments as RegistrationModel;

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
              "Foydalanish uchun parol kiriting ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.c1c1c1c,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Geometria"),
                children: [
                  const TextSpan(
                    text:
                        "Parol 8 ta belgidan kam bo'lmagan va kamida 1 ta katta harf, 1 ta son ishlatilgan bo'lishi lozim. ",
                    style: TextStyle(
                      color: AppColors.c1c1c1c,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    text: "foydalanish bomini kiritish",
                    style: const TextStyle(
                      color: AppColors.c1a73e8,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InputTextField(
              name: "Parolingizni tasdiqlang",
              controller: passwordController,
              showPasswordToggle: true,
            ),
            const SizedBox(height: 18),
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
              ],
              textAlignVertical: TextAlignVertical.center,
              obscureText: !passwordVisible,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    passwordVisible
                        ? "assets/icons/auth/eye_icon.svg"
                        : "assets/icons/auth/off_eye_icon.svg",
                    width: 22,
                    height: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
                border: InputBorder.none,
                hintText: "Parolingizni tasdiqlang",
                hintStyle:
                    const TextStyle(color: Color(0xFFB7B7B7), fontSize: 14),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.c1a73e8, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.cfcfdf0, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const Spacer(),
            const RoyhatdanOtishWidget(
              text: "Kirish",
            ),
            SizedBox(height: screenHeight * 0.03),
            ButtonBlue(
                color: passwordController.text.isNotEmpty
                    ? AppColors.c1a73e8
                    : const Color(0xFFFBCF7A),
                width: double.infinity,
                height: 48,
                text: "Keyingisi",
                onPressed: () async {
                  if (passwordKey.currentState!.validate()) {
                    regisModel.password = passwordController.text.trim();
                    NetworkService.POST(NetworkService.apiPostRegistration,
                        regisModel.toJson());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Registration Successful!")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
