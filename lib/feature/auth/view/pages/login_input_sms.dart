import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';

class LoginInputSms extends StatefulWidget {
  const LoginInputSms({super.key});

  @override
  State<LoginInputSms> createState() => _LoginInputSmsState();
}

class _LoginInputSmsState extends State<LoginInputSms> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  int currentSeconds = 0;

  String get timerText {
    if (timerMaxSeconds - currentSeconds <= 0) {
      return "Did not get a code";
    } else {
      return '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
    }
  }

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        debugPrint("${timer.tick}");
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

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
                  color: AppColors.c1c1c1c,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Geometria",
                ),
                children: [
                  const TextSpan(
                    text: "39 19 raqamiga sms kod yuborildi kodni \nkiriting",
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go("/login");
                      },
                    text: " raqamni qayta kiritish?",
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
                showPasswordToggle: false,
                name: "Sms kod",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    timerText,
                    style: const TextStyle(
                      color: AppColors.c1a73e8,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
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
              onPressed: () {
                context.goNamed("newPass");
              },
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
