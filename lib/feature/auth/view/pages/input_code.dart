import 'package:wide/core/screens/all.dart';

class InputCode extends StatelessWidget {
  const InputCode({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.c1c1c1c, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Geometria"),
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
                        context.go("/login");
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
            const Spacer(),
            Center(
              child: InputTextField(
                controller: codeController,
                name: "Sms kod",
                showPasswordToggle: false,
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
                    style: TextStyle(color: AppColors.c1a73e8, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ButtonBlue(
              width: double.infinity,
              color: AppColors.c1a73e8,
              height: 53,
              text: "Kirish",
              onPressed: () {},
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
