import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/pages/inside_chat.dart';
import 'package:wide/feature/home/view/pages/view_story.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  bool isSearchPressed = false;

  List<String> personImages = [
    "assets/images/ava_1.png",
    "assets/images/ava_2.png",
    "assets/images/ava_3.png",
    "assets/images/ava_4.png",
    "assets/images/ava_5.png",
    "assets/images/ava_6.png",
    "assets/images/ava_7.png",
    "assets/images/ava_8.png",
    "assets/images/ava_4.png",
    "assets/images/ava_5.png",
    "assets/images/ava_6.png",
    "assets/images/ava_7.png",
    "assets/images/ava_8.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: 70,
        title: _buildTitle(context),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(color: AppColors.cefefef, thickness: 1)),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: personImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(personImages[index]),
                    ),
                    Positioned(
                      bottom: 8,
                      right: -0.4,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0FE16D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InsideChat()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: AppColors.cefefef))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Topilov_1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: AppColors.c1c1c1c),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Salomat.uz dan video keldi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: AppColors.c707071),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "2 min ago",
                                  style: TextStyle(
                                      color: AppColors.c707071,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 4),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: AppColors.c1a73e8,
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: SvgPicture.asset(AppImages.returnIcon),
          ),
          isSearchPressed ? const Spacer() : const SizedBox.shrink(),
          isSearchPressed
              ? const SearchTextField()
              : Expanded(
                  child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: personImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  // ignore: prefer_const_constructors
                                  padding: EdgeInsets.all(
                                      2), // Adjust the padding as needed
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.c1a73e8,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewStory(
                                                    imagePath: "",
                                                  )));
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage(personImages[index]),
                                    ),
                                  ),
                                ));
                          }))),
          isSearchPressed ? const Spacer() : const SizedBox.shrink(),
          isSearchPressed
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchPressed = !isSearchPressed;
                    });
                  },
                  icon: SvgPicture.asset(AppImages.searchIcon))
        ],
      ),
    );
  }
}
