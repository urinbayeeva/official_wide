import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/profile/view/widgets/profile_name_pics.dart';

class MyFollowing extends StatefulWidget {
  const MyFollowing({super.key});

  @override
  State<MyFollowing> createState() => _MyFollowingState();
}

class _MyFollowingState extends State<MyFollowing> {
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: buildAppBar(context,
              contentWidget: const Text(
                "Obunachilar",
                style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSearchIcon: true),
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFEFEFEF)),
          Expanded(
            child: ListView.builder(
              itemCount: followersName.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(followersName[index],
                      style: const TextStyle(
                          color: AppColors.c1c1c1c,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(followersFullName,
                      style: const TextStyle(
                          color: AppColors.c707071,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  leading: CircleAvatar(
                      radius: 28, backgroundImage: AssetImage(images[index])),
                  trailing: ButtonBlue(
                    onPressed: () {
                      setState(() {
                        isFollowed = !isFollowed;
                      });
                    },
                    width: 170,
                    height: 34,
                    text: isFollowed ? "Followed" : "Follow",
                    textColor: isFollowed ? AppColors.c1c1c1c : Colors.white,
                    color: isFollowed ? AppColors.cf7f7f7 : AppColors.c1a73e8,
                  ),
                );
              },
            ),
          )
        ]));
  }
}
