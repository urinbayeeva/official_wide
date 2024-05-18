import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/profile/view/pages/language_page.dart';
import 'package:wide/feature/profile/view/pages/pullik_akkaunt.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: buildAppBar(context,
              contentWidget: const Text(
                "Sozlamalar",
                style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSearchIcon: false),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(children: [
                _buildSettingItem(
                    "assets/icons/auth/lang_icon.svg",
                    "Til",
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanguagePage()))),
                _buildSettingItem(
                    "assets/icons/home/premium_service.svg",
                    "Akkauntni pullik qilish",
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PullikAkkaunt()))),
                _buildSettingItem(
                    "assets/icons/profile/bell.svg",
                    "Bildirishnomalar",
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()))),
                _buildSettingItem(
                    "assets/icons/profile/user.svg",
                    "Foydalanuvchi ma'lumotlari",
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserInfo()))),
                _buildSettingItem(
                    "assets/icons/profile/info.svg",
                    "Admin",
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminPage()))),
                _buildSettingItem("assets/icons/profile/log_out.svg", "Chiqish",
                    () {
                  _showLogoutDialog();
                })
              ])),
        ));
  }

  Widget _buildSettingItem(String iconPath, String title, VoidCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.cefefef))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(iconPath, width: 60, height: 24),
                        const SizedBox(width: 16),
                        Text(
                          title,
                          style: const TextStyle(
                              color: AppColors.c1c1c1c,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/home/open_button.svg")
                  ],
                ),
              ),
            )));
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage())),
              icon: SvgPicture.asset(AppImages.returnIcon)),
          const Spacer(),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Sozlamalar",
                  style: TextStyle(
                      color: AppColors.c1c1c1c,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          const Spacer(),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "Akauntni tark etish?",
              style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Akauntni tarki etmoqchimisiz sizning\nakauntingiz saqlab qolinadi va ",
                style: TextStyle(
                    color: AppColors.c1c1c1c,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 48),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.cefefef),
                        top: BorderSide(width: 1, color: AppColors.cefefef))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Akkauntdan chiqish",
                      style: TextStyle(
                          color: AppColors.c1a73e8,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.cefefef),
                        top: BorderSide(width: 1, color: AppColors.cefefef))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Ortga qaytish",
                      style: TextStyle(
                          color: AppColors.c1c1c1c,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
