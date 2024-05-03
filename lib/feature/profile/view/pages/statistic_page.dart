import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: buildAppBar(context,
            contentWidget: const Text(
              "Statistika",
              style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            showSearchIcon: false),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Obunachilar",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/profile/followers.svg"),
                        const SizedBox(width: 15),
                        const Text(
                          "4,344",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Saqlangan videolar",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/profile/saved.svg"),
                        const SizedBox(width: 15),
                        const Text(
                          "2,456",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Yozilgan kommentlar",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/tab_bar/messsage_icon.svg"),
                        const SizedBox(width: 15),
                        const Text(
                          "2,567",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "To'lov qilgan obunachilar",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/profile/followers.svg"),
                        const SizedBox(width: 15),
                        const Text(
                          "300",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Layklar soni",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/tab_bar/heart.svg"),
                        const SizedBox(width: 15),
                        const Text(
                          "34,567",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Ulashilingan videolar",
                      style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/tab_bar/messsage_icon.svg"),
                        const SizedBox(width: 20),
                        const Text(
                          "1,567",
                          style: TextStyle(color: AppColors.c1a73e8, fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
