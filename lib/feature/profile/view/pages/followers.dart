import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';
import 'package:wide/feature/profile/view/widgets/profile_name_pics.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: buildAppBar(context,
              contentWidget: const Text(
                "Obunachilar",
                style: TextStyle(
                  color: AppColors.c1c1c1c,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSearchIcon: true),
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(width: double.infinity, height: 1, color: const Color(0xFFEFEFEF)),
          Expanded(
              child: ListView.builder(
                  itemCount: followersName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(followersName[index],
                            style:
                                const TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.w500)),
                        subtitle: Text(followersFullName,
                            style:
                                const TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w500)),
                        leading: CircleAvatar(radius: 40, backgroundImage: AssetImage(images[index])),
                        trailing: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    isFollowingList[index] ? const Color(0xFFEFEFEF) : AppColors.c1a73e8),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
                            onPressed: () {
                              setState(() {
                                isFollowingList[index] = !isFollowingList[index];
                              });
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(isFollowingList[index] ? "Following" : "Follow",
                                    style: TextStyle(
                                        color: isFollowingList[index] ? Colors.black : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))));
                  }))
        ]));
  }
}
