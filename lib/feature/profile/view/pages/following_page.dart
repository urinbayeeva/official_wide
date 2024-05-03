import 'package:wide/core/screens/all.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<String> FollowingPageName = ["Wide", "Wide", "Wide", "Wide", "Wide", "Wide", "Wide"];
    String FollowingPageFullName = "Coming soon";
    List<Color> colorDifference = [const Color(0xFFEFEFEF), const Color(0xFFF9B021)];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.returnIcon,
                  ),
                ),
                const Text(
                  "FollowingPage",
                  style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.searchIcon,
                  ),
                ),
              ],
            ),
          ),
          Container(width: double.infinity, height: 1, color: const Color(0xFFEFEFEF)),
          Expanded(
            child: ListView.builder(
              itemCount: FollowingPageName.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    FollowingPageName[index],
                    style: const TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    FollowingPageFullName,
                    style: const TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  leading: const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  trailing: const Expanded(
                      child: ButtonBlue(
                          width: 126, height: 40, text: "Follow", color: Color(0xFFF9B021), textColor: Colors.white)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
