import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/pages/all_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 3;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigationRail(
                backgroundColor: Colors.white,
                onDestinationSelected: (index) =>
                    setState(() => _currentPageIndex = index),
                labelType: NavigationRailLabelType.none,
                useIndicator: false,
                minWidth: 80,
                leading: _currentPageIndex == 2
                    ? const SizedBox.shrink()
                    : Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.cefefef))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          child: SvgPicture.asset("assets/icons/home/wide.svg"),
                        )),
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(
                    indicatorColor: Colors.transparent,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Image.asset("assets/icons/tab_bar/add_post.png",
                          width: 24, height: 24),
                    ),
                    label: const Text(""),
                  ),
                  NavigationRailDestination(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 28),
                      child: SvgPicture.asset(AppImages.personIcon),
                    ),
                    label: const Text(""),
                  ),
                  NavigationRailDestination(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 28),
                      child: SvgPicture.asset(AppImages.searchIcon),
                    ),
                    label: const Text(""),
                  ),
                  NavigationRailDestination(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 28),
                      child: SvgPicture.asset(AppImages.homeIcon),
                    ),
                    label: const Text(""),
                  ),
                ],
                selectedIndex: _currentPageIndex),
            Expanded(child: buildPages()),
          ],
        ),
      );
    });
  }

  Widget buildPages() {
    switch (_currentPageIndex) {
      case 0:
        return const Placeholder();
      case 1:
        return const ProfilePage();
      case 2:
        return const RecPage();
      case 3:
        return const AllPage();
      default:
        return Container();
    }
  }
}
