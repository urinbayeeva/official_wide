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
      return "Kod kelmadimi?";
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController codeController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go("/login");
                      },
                    text: " raqamni qayta kiritish?",
                    style: const TextStyle(
                      color: AppColors.c1a73e8,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            InputTextField(
              controller: codeController,
              showPasswordToggle: false,
              name: "Sms kod",
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    timerText,
                    style: const TextStyle(
                      color: AppColors.c1a73e8,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
            ButtonBlue(
              width: double.infinity,
              color: codeController.text.isNotEmpty
                  ? AppColors.c1a73e8
                  : AppColors.c1a73e8,
              height: 48,
              text: "Kirish",
              onPressed: () {
                context.go("/homePage");
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
