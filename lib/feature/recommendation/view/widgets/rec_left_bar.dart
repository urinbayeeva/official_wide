import 'package:wide/core/screens/all.dart';

class RecLeftBar extends StatelessWidget {
  const RecLeftBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(width: 1, color: Color(0xFFEFEFEF))),
            ),
            child: Column(
              children: [
                const SizedBox(height: 54),
                RotatedWidget(
                  imagePath: "assets/icons/home/plus.svg",
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                RotatedWidget(
                  imagePath: "assets/icons/tab_bar/profile_icon.svg",
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage())),
                ),
                const SizedBox(height: 8, width: 200),
                RotatedWidget(
                    imagePath: "assets/icons/tab_bar/search_icon.svg",
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecPage()))),
                const SizedBox(height: 8),
                RotatedWidget(
                    imagePath: "assets/icons/home/yellow_home.svg",
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
