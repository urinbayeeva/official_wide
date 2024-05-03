import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/pages/all_page.dart';
import 'package:wide/feature/home/view/pages/chat_page.dart';
import 'package:wide/feature/posts/view/pages/add_post.dart';
import 'package:wide/feature/recommendation/view/pages/rec_tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 3);
  int _currentPageIndex = 3;

  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: _currentPageIndex == 2
            ? AppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: const RecTabBar(
                  showPlusIcon: true,
                  showSearchIcon: true,
                ),
                toolbarHeight: 80)
            : null,
        body: OrientationBuilder(builder: (context, orientation) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _currentPageIndex == 2
                        ? const SizedBox.shrink()
                        : Container(
                            width: 90,
                            height: 64,
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1, color: AppColors.cefefef))),
                            child: Center(
                              child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const ChatPage())),
                                  child: SvgPicture.asset(
                                    "assets/icons/home/wide.svg",
                                    width: 52,
                                    height: 36,
                                  )),
                            ),
                          ),
                    const Spacer(),
                    const SizedBox(height: 8),
                    _buildIconButton("assets/icons/tab_bar/add_post.png", 0),
                    _buildIconButton("assets/icons/tab_bar/person_bottom.png", 1),
                    _buildIconButton("assets/icons/tab_bar/search_image.png", 2),
                    _buildIconButton("assets/icons/tab_bar/home_outlined.png", 3),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: false,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  children: const [
                    AddPost(),
                    ProfilePage(),
                    RecPage(),
                    AllPage(),
                  ],
                ),
              ),
            ],
          );
        }),
      );
    });
  }

  Widget _buildIconButton(String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToPage(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          color: _currentPageIndex == index ? AppColors.c1a73e8 : null,
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    _pageController.jumpToPage(index);
  }
}
