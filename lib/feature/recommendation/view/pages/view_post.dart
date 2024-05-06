import 'package:expandable_text/expandable_text.dart';
import 'package:wide/core/screens/all.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  bool isTappedText = false;
  bool isLiked = false;
  int likeCount = 0;
  bool isFollowed = false;

  List<String> wideImage = [
    "assets/images/home/first.jpg",
    "assets/images/home/second.jpg",
    "assets/images/home/third.jpg",
    "assets/images/home/fourth.jpg",
    "assets/images/home/five.jpg",
    "assets/images/home/six.jpg"
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
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppImages.returnIcon,
                          width: 24, height: 24)),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: scrollToPreviousImage,
                          child: SvgPicture.asset(
                              "assets/icons/home/up_icon.svg",
                              width: 38,
                              height: 38)),
                      const SizedBox(height: 40),
                      GestureDetector(
                          onTap: scrollToNextImage,
                          child: SvgPicture.asset(
                              "assets/icons/home/down_icon.svg",
                              width: 38,
                              height: 38)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: widget.imagePath.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: AspectRatio(
                              aspectRatio: 16 / 10,
                              child: Image.asset(
                                widget.imagePath,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 4,
                            child: IconButton(
                              onPressed: () {
                                moreBottomSheet(context);
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/post/more_icon.svg"),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 100)
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 18,
                                              backgroundImage: AssetImage(
                                                  personImages[index]),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              userName[index],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 34),
                                            SvgPicture.asset(
                                              AppImages.eyeIcon,
                                              color: Colors.white,
                                              width: 18,
                                              height: 18,
                                            ),
                                            const SizedBox(width: 4),
                                            const Text(
                                              "400     1 soat oldin",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                width: 0.5),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isFollowed = !isFollowed;
                                              });
                                            },
                                            child: Container(
                                              height: 24,
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Text(
                                                  isFollowed
                                                      ? 'Following'
                                                      : 'Follow',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isTappedText = !isTappedText;
                                        });
                                      },
                                      child: ExpandableText(
                                        textOfPost[index],
                                        expandText: '           ',
                                        maxLines: 1,
                                        collapseOnTextTap: true,
                                        linkColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 8),
                      // const Divider(),
                    ],
                  );
                },
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                RotatedWidget(
                  imagePath: isLiked
                      ? "assets/icons/tab_bar/like.svg"
                      : "assets/icons/home/like_black.svg",
                  widht: 24,
                  height: 24,
                  text: "123..k",
                  onPressed: () {
                    setState(() {
                      if (isLiked) {
                        likeCount--;
                      } else {
                        likeCount++;
                      }
                      isLiked = !isLiked;
                    });
                  },
                ),
                RotatedWidget(
                    imagePath: "assets/icons/tab_bar/messsage_icon.svg",
                    widht: 24,
                    height: 24,
                    text: "10",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CommentPage()));
                    }),
                RotatedWidget(
                  imagePath: "assets/icons/tab_bar/send.svg",
                  text: "102",
                  widht: 24,
                  height: 24,
                  onPressed: () => showHorizontalBottomSheet(context),
                ),
                RotatedWidget(
                  imagePath: "assets/icons/tab_bar/saved.svg",
                  widht: 24,
                  height: 24,
                  onPressed: () => showHorizontalBottomSheet(context),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
