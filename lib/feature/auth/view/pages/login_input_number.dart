import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wide/core/screens/all.dart';

class LoginInputNumber extends StatelessWidget {
  const LoginInputNumber({Key? key}) : super(key: key);

  // Future<void> sendSmsCode(BuildContext context, String phoneCode, String phoneNumber) async {
  //   final String url = 'http://95.47.238.47:5000/api-client/Login/SendSmsCode';
  //   Map<String, dynamic> requestBody = {
  //     'phoneCode': phoneCode,
  //     'phoneNumber': phoneNumber,
  //   };

  //   String encodedBody = jsonEncode(requestBody);

  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: encodedBody,
  //     );

  //     if (response.statusCode == 200) {
  //       // Request successful, handle response as needed
  //       print('SMS Code Sent Successfully');
  //       // Navigate to the input SMS code page
  //       context.go("/inputSms");
  //     } else {
  //       // Handle unsuccessful request
  //       print('Failed to send SMS code: ${response.statusCode}');
  //       // Show error message to the user
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Failed to send SMS code. Please try again later.'),
  //         ),
  //       );
  //     }
  //   } catch (error) {
  //     // Handle any errors that occurred during the request
  //     print('Error: $error');
  //     // Show error message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('An unexpected error occurred. Please try again later.'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController phoneCodeController = TextEditingController();
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
              "Raqamingizni kiriting va sizga sms\n xabar yuboriladi ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 83,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFCFCFD0),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: phoneCodeController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "+998",
                      hintStyle: TextStyle(
                        color: Color(0xFFB7B7B7),
                        fontSize: 16,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFCFCFD0),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "90 000 00 00",
                      hintStyle: TextStyle(
                        color: Color(0xFFB7B7B7),
                        fontSize: 16,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go("/login");
                  },
                  child: const Text(
                    "Parolni qayta kiritish",
                    style: TextStyle(color: AppColors.c1a73e8, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.go("/registration");
              },
              child: const Text(
                "Ro'yhatdan o'tish",
                style: TextStyle(
                  color: AppColors.c1a73e8,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            ButtonBlue(
              width: double.infinity,
              color: AppColors.c1a73e8,
              height: 53,
              text: "Kirish",
              onPressed: () {
                String phoneCode = phoneCodeController.text;
                String phoneNumber = phoneNumberController.text;
                // sendSmsCode(context, phoneCode, phoneNumber);
                context.go("/inputSms");
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
