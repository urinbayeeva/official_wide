import 'package:wide/core/screens/all.dart';

class LoginInputNumber extends StatelessWidget {
  const LoginInputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController phoneCodeController = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.20),
            const Text("Raqamingizni kiriting va sizga sms\n xabar yuboriladi ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.c1c1c1c,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: screenHeight * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberTextField(),
                const AllNumberTextField(),
              ],
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    ;
                  },
                  child: const Text("Parolni qayta kiritish",
                      style: TextStyle(
                          color: AppColors.c1a73e8,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)))
            ]),
            const Spacer(),
            const RoyhatdanOtishWidget(text: "Ro'yxatdan o'tish"),
            SizedBox(height: screenHeight * 0.03),
            ButtonBlue(
                width: double.infinity,
                color: phoneNumberController.text.isNotEmpty
                    ? AppColors.c1a73e8
                    : AppColors.c1a73e8,
                height: 48,
                text: "Kirish",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginInputSms()));
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
