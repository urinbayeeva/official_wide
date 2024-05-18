import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class PullikAkkaunt extends StatefulWidget {
  const PullikAkkaunt({super.key});

  @override
  State<PullikAkkaunt> createState() => _PullikAkkauntState();
}

class _PullikAkkauntState extends State<PullikAkkaunt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: buildAppBar(context,
              contentWidget: const Text(
                "Akkauntni pullik qilish",
                style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSearchIcon: false),
        ),
        body: _buildSettingItem("Premium versiyag ao'tish", () {}));
  }

  Widget _buildSettingItem(String title, VoidCallback onTap) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    Text(title,
                        style: const TextStyle(
                            color: AppColors.c1c1c1c,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SvgPicture.asset("assets/icons/home/open_button.svg")
                  ],
                ),
              ),
            )));
  }
}
