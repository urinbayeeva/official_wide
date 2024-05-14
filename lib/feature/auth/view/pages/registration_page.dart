import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/auth/view/pages/input_textfield.dart';
import 'package:wide/feature/auth/view_model/register_model.dart';
import 'package:wide/feature/auth/view_model/register_service.dart';

class RegistrationPage extends StatefulWidget {
  final TextEditingController? getPassword;
  const RegistrationPage({super.key, this.getPassword});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: screenSize.height * 0.1),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.c1c1c1c,
                        fontSize: 16,
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(
                            text: "Agar ro'yhatdan o’tgan bo'lsangiz "),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage())),
                          text: "kirish\n",
                          style: const TextStyle(
                            color: AppColors.c1a73e8,
                            fontWeight: FontWeight.w600,
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
                  SizedBox(height: screenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      NumberTextField(),
                      SizedBox(width: screenSize.width * 0.02),
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
                  customElevatedButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14))
                          ])),
                  const Spacer(),
                  ButtonBlue(
                      color: nameController.text.isNotEmpty &&
                              phoneNumberController.text.isNotEmpty
                          ? AppColors.c1a73e8
                          : const Color(0xFFFBCF7A),
                      width: double.infinity,
                      height: 48,
                      text: "Keyingisi",
                      onPressed: () async {
                        if (nameController.text.isNotEmpty &&
                            phoneNumberController.text.isNotEmpty) {
                          RegistrationModel regisModel = RegistrationModel(
                            userName: nameController.text.trim(),
                            password: "feruza3590",
                            phone: "{phoneNumberController.text.trim()}",
                          );

                          debugPrint(
                              "${regisModel.userName}, ${regisModel.phone}, ${regisModel.password}");
                          await NetworkService.POST(
                              NetworkService.apiPostData, regisModel.toJson());
                          setState(() {});
                        }

                        if (nameController.text.isNotEmpty &&
                            phoneNumberController.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InputName()));
                        } else {}
                      }),
                  const SizedBox(height: 15)
                ]))));
  }
}
