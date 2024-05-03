import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: buildAppBar(context,
            contentWidget: const Text(
              "Edit profile",
              style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            showSearchIcon: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 136,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.cefefef),
                          right: BorderSide(width: 1, color: AppColors.cefefef),
                        )),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "User name",
                            style: TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 22),
                          Text(
                            "Topilov_1",
                            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            backgroundColor: Colors.white,
                            title: const Center(
                              child: Text(
                                "Edit password",
                                style: TextStyle(color: AppColors.c1c1c1c, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            content: SizedBox(
                              width: 320,
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Password",
                                      style: TextStyle(
                                          color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: "  **********",
                                          focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: AppColors.cf1f5f9),
                                          ),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                              icon: SvgPicture.asset(_obscureText
                                                  ? "assets/icons/auth/off_eye_icon.svg"
                                                  : AppImages.eyeIcon))),
                                      obscureText: _obscureText,
                                    ),
                                    const SizedBox(height: 8),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                              color: AppColors.c1a73e8, fontSize: 14, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    // SizedBox(height: 40),
                                  ],
                                ),
                              ),
                            ),
                            actions: const [
                              ButtonBlue(
                                color: AppColors.c1a73e8,
                                text: "Save",
                                textColor: Colors.white,
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 136,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.cefefef),
                          right: BorderSide(width: 1, color: AppColors.cefefef),
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 22),
                            Text(
                              "*****************",
                              style: TextStyle(color: AppColors.c1c1c1c, fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 136,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.cefefef),
                          right: BorderSide(width: 1, color: AppColors.cefefef),
                        )),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Gmail",
                            style: TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 22),
                          Text(
                            "topilova23@gmail.com",
                            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 136,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.cefefef),
                          right: BorderSide(width: 1, color: AppColors.cefefef),
                        )),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 22),
                          Text(
                            "+9989 99 408 39 19",
                            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
