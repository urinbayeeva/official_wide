import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/profile/view/pages/setting_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  bool isTappedMute = false;
  bool isTappedUnmute = false;

  List<MusicName> musicName = [
    MusicName(name: "Musiqa 1"),
    MusicName(name: "Musiqa 2"),
    MusicName(name: "Musiqa 3"),
    MusicName(name: "Musiqa 4"),
    MusicName(name: "Musiqa 5")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: buildAppBar(context,
              contentWidget: const Text(
                "Habarlar ovozi",
                style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSearchIcon: false),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                radius: 2,
                onTap: () {
                  setState(() {
                    isTappedMute = !isTappedMute;
                  });
                },
                child: Container(
                  width: 188,
                  height: 76,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: isTappedMute
                          ? Border.all(width: 1, color: AppColors.c1a73e8)
                          : Border.all(width: 1, color: AppColors.cefefef)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/profile/unmute.svg", width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text(
                        "Ovozsiz",
                        style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 65),
              InkWell(
                radius: 2,
                onTap: () {
                  setState(() {
                    isTappedUnmute = !isTappedUnmute;
                  });
                },
                child: Container(
                  width: 188,
                  height: 76,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: isTappedUnmute
                          ? Border.all(width: 1, color: AppColors.c1a73e8)
                          : Border.all(width: 1, color: AppColors.cefefef)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/profile/unmute.svg", width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text(
                        "Ovozsiz",
                        style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: musicName.length,
                itemBuilder: (context, index) {
                  final name = musicName[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: CheckboxListTile(
                      checkColor: AppColors.c1a73e8,
                      fillColor: MaterialStateProperty.all<Color>(Colors.white),
                      hoverColor: AppColors.c1a73e8,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        name.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      value: name.selected,
                      onChanged: (newValue) {
                        setState(() {
                          name.selected = newValue ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(
                        color: AppColors.c1a73e8,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class MusicName {
  final String name;
  bool selected;

  MusicName({required this.name, this.selected = false});
}
