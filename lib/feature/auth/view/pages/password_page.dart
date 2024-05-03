import 'package:wide/core/screens/all.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    bool passwordVisible = true;
    final passwordKey = GlobalKey<FormState>();

    @override
    void initState() {
      passwordVisible = false;
      super.initState();
    }

    String? validatePassword(String? value) {
      const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter and digits"
          : null;
    }

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
              style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 14,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.c1c1c1c, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Geometria"),
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
                        context.go("/login");
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
            Center(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFCFCFD0),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                    ],
                    validator: validatePassword,
                    key: passwordKey,
                    autocorrect: false,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: !passwordVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: passwordVisible
                          ? IconButton(
                              icon: SvgPicture.asset(
                                passwordVisible
                                    ? "assets/icons/auth/eye_icon.svg"
                                    : "assets/icons/auth/off_eye_icon.svg",
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      hintText: "Parolingiz",
                      hintStyle: const TextStyle(
                        color: Color(0xFFB7B7B7),
                        fontSize: 16,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ButtonBlue(
              width: double.infinity,
              color: AppColors.c1a73e8,
              height: 53,
              text: "Kirish",
              onPressed: () => context.go("/profilePage"),
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
