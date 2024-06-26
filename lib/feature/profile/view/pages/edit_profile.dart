import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/profile/view/widgets/info_account.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: buildAppBar(context,
              contentWidget: const Text("Edit profile",
                  style: TextStyle(
                      color: AppColors.c1c1c1c,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              showSearchIcon: false)),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Image.asset("assets/icons/profile/person_ava.png",
                      width: 72, height: 72),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  _buildTextField("User name", "Asadbek"),
                  const SizedBox(height: 12),
                  _buildTextField("Name", "Asadbek"),
                  const SizedBox(height: 12),
                  _buildTextField("Bio", "Bio"),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoAccount()));
                    },
                    child: const Text(
                      "\t\t\t\t\tParolni yangilash",
                      style: TextStyle(
                          color: AppColors.c1a73e8,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,
              style: const TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            width: 332,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cb7b7b7),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB7B7B7)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
