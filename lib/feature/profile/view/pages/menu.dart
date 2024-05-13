import 'package:wide/core/screens/all.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: _buildTitle(),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(color: AppColors.cefefef, thickness: 1),
            )),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(children: [
              _buildSettingItem(
                  "assets/icons/profile/saved.svg", "Saqlanganlar", () {
                Navigator.pushNamed(context, "savedPage");
              }),
              _buildSettingItem(
                  "assets/icons/profile/settings.svg", "Sozlamalar", () {
                Navigator.pushNamed(context, "settingPage");
              }),
              _buildSettingItem(
                  "assets/icons/profile/payment.svg", "To'lov", () {}),
              _buildSettingItem(
                  "assets/icons/profile/statistic.svg", "Statistika", () {
                Navigator.pushNamed(context, "statistikaPage");
              }),
            ])));
  }

  Widget _buildSettingItem(String iconPath, String title, VoidCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: AppColors.cefefef))),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(children: [
                      SvgPicture.asset(iconPath, width: 60, height: 24),
                      const SizedBox(width: 16),
                      Text(
                        title,
                        style: const TextStyle(
                            color: AppColors.c1c1c1c,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ])))));
  }

  Widget _buildTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppImages.returnIcon),
          ),
          const Spacer(),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Menu",
                style: TextStyle(
                    color: AppColors.c1c1c1c,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          const Spacer(),
        ]));
  }
}
