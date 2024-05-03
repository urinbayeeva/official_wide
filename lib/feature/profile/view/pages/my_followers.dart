import 'package:wide/core/screens/all.dart';

class MyFollowers extends StatefulWidget {
  const MyFollowers({super.key});

  @override
  State<MyFollowers> createState() => _MyFollowersState();
}

class _MyFollowersState extends State<MyFollowers> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  bool isFollowed = true;

  @override
  Widget build(BuildContext context) {
    List<String> MyFollowersName = ["Wide", "Wide", "Wide", "Wide", "Wide", "Wide", "Wide"];
    String MyFollowersFullName = "Coming soon";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    AppImages.returnIcon,
                  ),
                ),
                const SearchTextField(),
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
              itemCount: MyFollowersName.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    MyFollowersName[index],
                    style: const TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    MyFollowersFullName,
                    style: const TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  leading: const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  trailing: const Expanded(
                      child: ButtonBlue(
                          width: 126,
                          height: 40,
                          text: "Following",
                          color: Color(0xFFF7F7F7),
                          textColor: AppColors.c1c1c1c)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
