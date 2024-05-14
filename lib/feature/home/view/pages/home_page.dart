import 'package:image_picker/image_picker.dart';

import 'package:wide/core/screens/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 3;

  final GlobalKey<NavigatorState> addPost = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> searchPage = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profilePage = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> homePage = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _currentPageIndex == 2
          ? AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const RecTabBar(showPlusIcon: true, showSearchIcon: true),
              toolbarHeight: 80)
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavigationRail(),
          Expanded(child: _buildPages()),
        ],
      ),
    );
  }

  Widget _buildNavigationRail() {
    return _currentPageIndex == 0
        ? const SizedBox.shrink()
        : SizedBox(
            width: 90,
            child: NavigationRail(
              backgroundColor: Colors.white,
              onDestinationSelected: (index) =>
                  setState(() => _currentPageIndex = index),
              labelType: NavigationRailLabelType.none,
              useIndicator: false,
              leading: _currentPageIndex == 2
                  ? const SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: _currentPageIndex == 1
                                  ? BorderSide.none
                                  : const BorderSide(
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
                    child: SvgPicture.asset(
                      AppImages.plusIcon,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  label: const Text(""),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 28),
                    child: SvgPicture.asset(
                      AppImages.personIcon,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  label: const Text(""),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 28),
                    child: SvgPicture.asset(
                      AppImages.searchIcon,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  label: const Text(""),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 28),
                    child: SvgPicture.asset(
                      AppImages.homeIcon,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  label: const Text(""),
                ),
              ],
              selectedIndex: _currentPageIndex,
            ),
          );
  }

  Widget _buildPages() {
    switch (_currentPageIndex) {
      case 0:
        return CameraScreen(key: addPost);
      case 1:
        return MyProfilePage(key: profilePage);
      case 2:
        return RecPage(key: searchPage);
      case 3:
        return AllPage(key: homePage);
      default:
        return Container();
    }
  }

  Widget buildCameraOrGalleryPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Open camera
            getImage(ImageSource.camera);
          },
          child: const Text('Take Photo'),
        ),
        ElevatedButton(
          onPressed: () {
            // Open gallery
            getImage(ImageSource.gallery);
          },
          child: const Text('Choose from Gallery'),
        ),
      ],
    );
  }

  // Method to handle image capture/pick
  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // Navigate to another page to display the picked image
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraScreen(),
        ),
      );
    }
  }
}
