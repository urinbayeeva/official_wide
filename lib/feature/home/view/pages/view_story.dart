import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class ViewStory extends StatefulWidget {
  const ViewStory({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ViewStory> createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  bool isTappedText = false;
  bool isLiked = false;
  int likeCount = 0;
  bool isFollowed = false;

  List<String> wideImage = [
    "assets/images/i.png",
    "assets/images/o.png",
  ];

  List<String> userName = [
    "nature_offical",
    "cars_interest",
    "cartoons",
    "flowers_page",
    "hobbies",
    "photo_of_nature",
  ];

  List<String> textOfPost = [
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga",
    "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum"
        ". Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
  ];

  List<String> personImages = [
    "assets/images/ava_1.png",
    "assets/images/ava_2.png",
    "assets/images/ava_3.png",
    "assets/images/ava_4.png",
    "assets/images/ava_5.png",
    "assets/images/ava_6.png",
    "assets/images/ava_7.png",
    "assets/images/ava_8.png"
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    int currentIndex = 0;
    void scrollToNextImage() {
      if (currentIndex < wideImage.length - 1) {
        currentIndex++;
        scrollController.animateTo(
          currentIndex * MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }

    void scrollToPreviousImage() {
      if (currentIndex > 0) {
        currentIndex--;
        scrollController.animateTo(
          currentIndex * MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppImages.returnIcon,
                          width: 24, height: 24)),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/tab_bar/left.svg"),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: wideImage.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: AspectRatio(
                              aspectRatio: 16 / 10,
                              child: Image.asset(wideImage[index],
                                  fit: BoxFit.fill))),
                      const SizedBox(height: 8),
                      const Positioned(
                          top: 0,
                          left: 16,
                          child: Row(children: [
                            CircleAvatar(
                                radius: 24, backgroundColor: Colors.grey),
                            SizedBox(width: 4),
                            Text("username",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500))
                          ]))
                    ]);
                  })),
          SizedBox(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset("assets/icons/tab_bar/right.svg")],
            ),
          ),
        ],
      ),
    );
  }
}
