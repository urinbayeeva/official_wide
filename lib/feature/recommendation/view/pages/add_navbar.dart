import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/recommendation/view/widgets/add_navbar_item.dart';

class AddNavBar extends StatefulWidget {
  final Function(bool)? onRedCirclePressed;
  const AddNavBar({Key? key, this.onRedCirclePressed}) : super(key: key);

  @override
  State<AddNavBar> createState() => _AddNavBarState();
}

class _AddNavBarState extends State<AddNavBar> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void handleRedCirclePressed(bool isPressed) {
    widget.onRedCirclePressed!(isPressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: buildAppBar(
          context,
          contentWidget: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: index == 1
                ? const SearchTextField()
                : const Text(
                    "Nav bar qo'shish",
                    style: TextStyle(
                      color: AppColors.c1c1c1c,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          showSearchIcon: index == 1 ? false : true,
          function: () {
            setState(() {
              index = 1;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              RecTabBar(
                showSearchIcon: false,
                showDelete: true,
                showPlusIcon: false,
                showRedCircleDefault: true,
                onRedCirclePressed: handleRedCirclePressed,
              ),
              const SizedBox(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tanlangan yo'nalishlar",
                    style: TextStyle(
                      color: AppColors.c1c1c1c,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Yo'nalish qatori to'lgan!",
                    style: TextStyle(
                      color: AppColors.cf92121,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              const Divider(height: 1, color: Color(0xFFEFEFEF)),
              const SizedBox(height: 20),
              const AddNavBarItem(),
              const SizedBox(height: 16),
              const AddNavBarItem(),
              const SizedBox(height: 32),
              const Text(
                "Faqatgina 8 ta yo'nalish qo'shish mumkin",
                style: TextStyle(
                  color: AppColors.cf92121,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
