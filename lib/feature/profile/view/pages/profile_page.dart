import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/profile/view/pages/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
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
          // Padding(
          //     padding: const EdgeInsets.only(top: 16),
          //     child: Expanded(
          //         child: SizedBox(
          //             child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //       SizedBox(
          //           child: IconButton(
          //               onPressed: () {}, icon: SvgPicture.asset("assets/icons/home/wide.svg", width: 50, height: 40))),
          //       const SizedBox(height: 40),
          //       Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //         const SizedBox(width: 10),
          //         Column(children: [
          //           RotatedWidget(imagePath: AppImages.plusIcon, onPressed: () {}),
          //           const SizedBox(height: 12),
          //           RotatedWidget(imagePath: AppImages.personYellow, onPressed: () {}),
          //           const SizedBox(height: 12),
          //           RotatedWidget(imagePath: AppImages.searchIcon, onPressed: () {}),
          //           const SizedBox(height: 12),
          //           RotatedWidget(imagePath: AppImages.homeIcon, onPressed: () => context.go("/homePage"))
          //         ])
          //       ])
          //     ])))),
          // Second Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                decoration: const BoxDecoration(border: Border(left: BorderSide(width: 1, color: AppColors.cefefef))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 12),
                          GestureDetector(
                              onTap: () =>
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile())),
                              child: Image.asset("assets/icons/profile/person_ava.png", width: 64, height: 64)),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Topilov_1",
                                  style:
                                      TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.w600)),
                              Text("Asadbek Topilov",
                                  style: TextStyle(color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w500))
                            ],
                          ),
                          const Spacer(),
                          Container(
                              height: 48,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.cf7f7f7),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                  child: Row(children: [
                                    const Text(
                                      "Posts",
                                      style: TextStyle(
                                          color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text("36",
                                        style: TextStyle(
                                            color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 24),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => const Followers())),
                                      child: const Text("Followers",
                                          style: TextStyle(
                                              color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w400)),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text("12.2K",
                                        style: TextStyle(
                                            color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 24),
                                    const Text("Following",
                                        style: TextStyle(
                                            color: AppColors.c707071, fontSize: 14, fontWeight: FontWeight.w400)),
                                    const SizedBox(width: 8),
                                    const Text("98",
                                        style: TextStyle(
                                            color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 24),
                                  ]))),
                          const SizedBox(width: 24),
                          IconButton(
                              onPressed: () => context.goNamed("menu"),
                              icon: SvgPicture.asset("assets/icons/profile/menu.svg", width: 24, height: 24)),
                          const SizedBox(width: 24),
                        ],
                      ),
                      const SizedBox(height: 23),
                      Container(width: double.infinity, height: 1, color: AppColors.cefefef),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 24),
                          const Text(
                            "Xercitation ullamco laboris nisi ut aliquip ex ea\ncommodo consequat. Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum \nreprehenderit in voluptate velit esse cillum . . .",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.c707071),
                          ),
                          const SizedBox(width: 24),
                          ButtonBlue(
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
                          const SizedBox(width: 10),
                          ButtonBlue(
                              onPressed: () {},
                              width: 170,
                              height: 34,
                              text: "Message",
                              color: AppColors.cf7f7f7,
                              textColor: AppColors.c1c1c1c),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(width: double.infinity, height: 1, color: AppColors.cefefef),
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
                        height: 400,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Column(
                              children: List.generate(
                                3,
                                (index) => Row(
                                  children: List.generate(
                                    3,
                                    (index) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Image.asset(profileImages[index], fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                3,
                                (index) => Row(
                                  children: List.generate(
                                    3,
                                    (index) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Image.asset(profileImages[index], fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
