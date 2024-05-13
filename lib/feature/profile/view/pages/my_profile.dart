import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/profile/view/widgets/profile_name_pics.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isFollowed = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> profileImages = [
    "assets/images/profile/lambo.png",
    "assets/images/profile/ferrari.png",
    "assets/images/profile/car.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1, color: AppColors.cefefef))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 12),
                          Image.asset("assets/icons/profile/person_ava.png",
                              width: 64, height: 64),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Topilov_1",
                                  style: TextStyle(
                                      color: AppColors.c1c1c1c,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              Text("Asadbek Topilov",
                                  style: TextStyle(
                                      color: AppColors.c707071,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          const Spacer(),
                          Container(
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.cf7f7f7),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: Row(children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Posts",
                                        style: TextStyle(
                                            color: AppColors.c707071,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text("3",
                                        style: TextStyle(
                                            color: AppColors.c1c1c1c,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 24),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Followers())),
                                      child: const Text("Followers",
                                          style: TextStyle(
                                              color: AppColors.c707071,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Followers())),
                                      child: const Text("250",
                                          style: TextStyle(
                                              color: AppColors.c1c1c1c,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(width: 24),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyFollowing())),
                                      child: const Text("Following",
                                          style: TextStyle(
                                              color: AppColors.c707071,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyFollowing())),
                                      child: const Text("10",
                                          style: TextStyle(
                                              color: AppColors.c1c1c1c,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(width: 24),
                                  ]))),
                          const SizedBox(width: 24),
                          IconButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MenuPage())),
                              icon: SvgPicture.asset(
                                  "assets/icons/profile/menu.svg",
                                  width: 24,
                                  height: 24)),
                          const SizedBox(width: 24),
                        ],
                      ),
                      const SizedBox(height: 23),
                      Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.cefefef),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 24),
                          const Text(
                            "Xercitation ullamco laboris nisi ut aliquip ex ea\ncommodo consequat. Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum \nreprehenderit in voluptate velit esse cillum . . .",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c707071),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: ButtonBlue(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfile()));
                                },
                                height: 38,
                                text: "Edit",
                                color: AppColors.cf7f7f7,
                                textColor: AppColors.c1c1c1c),
                          ),
                          const SizedBox(width: 80),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.cefefef),
                      TabBar(
                        labelColor: AppColors.c1a73e8,
                        indicatorColor: AppColors.c1a73e8,
                        controller: _tabController,
                        tabs: const [
                          Tab(text: "Wide"),
                          Tab(text: "Photos"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4),
                                itemCount: profileImages.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ViewPost(
                                                    imagePath:
                                                        profileImages[index])));
                                      },
                                      child: Image.asset(profileImages[index]));
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
