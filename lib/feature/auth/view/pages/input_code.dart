import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class InputCode extends StatelessWidget {
  const InputCode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool _showClearButton =
        false; // You can use this later to control clear button visibility
    TextEditingController codeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Geometria",
                ),
                children: [
                  const TextSpan(
                    text: "39 19 raqamiga sms kod yuborildi kodni \nkiriting",
                    style: TextStyle(
                      color: AppColors.c1c1c1c,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        ;
                      },
                    text: " sms kod kelmadimi?",
                    style: const TextStyle(
                      color: AppColors.c1a73e8,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: AppColors.c1a73e8,
                controller: codeController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
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
                  border: InputBorder.none,
                  hintText: "Sms kod",
                  hintStyle:
                      const TextStyle(color: Color(0xFFB7B7B7), fontSize: 14),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Raqamni qayta kiritish",
                    style: TextStyle(
                        color: AppColors.c1a73e8,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ButtonBlue(
              color: codeController.text.isNotEmpty
                  ? AppColors.c1a73e8
                  : const Color(0xFFFBCF7A),
              width: double.infinity,
              height: 48,
              text: "Keyingisi",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InputCode()));
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
