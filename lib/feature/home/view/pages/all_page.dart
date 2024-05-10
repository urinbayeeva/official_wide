import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:wide/core/screens/all.dart';

class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  late List<VideoPlayerController> _videoControllers = [];
  late List<bool> _isVideoPlaying = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
    _pageController = PageController();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void _initializeVideoPlayers() {
    List videoUrls = contentList
        .where((element) => element.toString().contains('.mp4'))
        .toList();

    for (String videoUrl in videoUrls) {
      VideoPlayerController controller = VideoPlayerController.asset(videoUrl);
      _videoControllers.add(controller);
      _isVideoPlaying.add(false);
      controller.initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (VideoPlayerController controller in _videoControllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  List<dynamic> contentList = [
    "assets/images/mine.mp4",
    "assets/videos/domla.mp4",
    "assets/videos/nature.mp4",
    "assets/images/mine.MP4",
    "assets/images/mem.jpg",
    "assets/images/i.png",
    "assets/images/i.png",
    "assets/images/o.png",
    "assets/images/q.png",
    "assets/images/r.png",
    "assets/images/t.png",
    "assets/images/home/second.jpg",
    "assets/images/home/third.jpg",
    "assets/images/home/fourth.jpg",
  ];

  List<String> userName = [
    "nature_offical",
    "cars_interest",
    "cartoons",
    "flowers_page",
    "hobbies",
    "photo_of_nature",
    "flowers_page",
    "hobbies",
  ];

  List<String> textOfPost = [
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga",
    "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum",
    ". Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    ". Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
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
    "assets/images/ava_8.png",
  ];

  List<String> comments = [];
  int currentPageIndex = 0;
  bool isTappedText = false;
  bool isLiked = false;
  int likeCount = 0;
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _pauseAllVideos();
                }
                return false;
              },
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    if (contentList[index].toString().contains('.mp4')) {
                      return _buildVideoWidget(index);
                    } else {
                      return _buildImageWidget(contentList[index]);
                    }
                  }),
            ),
          ),
          SizedBox(
            width: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 64,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: AppColors.cefefef))),
                  child: Center(
                    child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatPage())),
                        child: SvgPicture.asset(
                            "assets/icons/tab_bar/notification.svg",
                            width: 22,
                            height: 22)),
                  ),
                ),
                const Spacer(),
                RotatedWidget(
                  imagePath: isLiked
                      ? "assets/icons/tab_bar/like.svg"
                      : "assets/icons/home/like_black.svg",
                  widht: 22,
                  height: 22,
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
                    widht: 22,
                    height: 22,
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
                  widht: 22,
                  height: 22,
                  onPressed: () => showHorizontalBottomSheet(context),
                ),
                const RotatedWidget(
                  imagePath: "assets/icons/tab_bar/saved.svg",
                  widht: 22,
                  height: 22,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoWidget(int index) {
    return _videoControllers[index].value.isInitialized
        ? Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_videoControllers[index].value.isPlaying) {
                      _videoControllers[index].pause();
                    } else {
                      _videoControllers[index].play();
                    }
                  });
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _videoControllers[index].value.aspectRatio,
                    child:
                        ClipRRect(child: VideoPlayer(_videoControllers[index])),
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
                    "assets/icons/post/more_icon.svg",
                  ),
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
                        blurRadius: 100,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundImage:
                                      AssetImage(personImages[index]),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  userName[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
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
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 0.5,
                                ),
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      isFollowed ? 'Following' : 'Follow',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
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
                            animation: true,
                            expandOnTextTap: true,
                            textOfPost[index],
                            expandText: '',
                            maxLines: 1,
                            collapseOnTextTap: true,
                            linkColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Play/Pause Button
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: !_videoControllers[index].value.isPlaying
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_videoControllers[index].value.isPlaying) {
                                _videoControllers[index].pause();
                              } else {
                                _videoControllers[index].play();
                              }
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(
                              _videoControllers[index].value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
              // Progress indicator
              Positioned(
                left: 20,
                right: 16,
                bottom: 8,
                child: ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: _videoControllers[index],
                  builder: (context, value, _) {
                    final progress = value.position.inMilliseconds /
                        value.duration.inMilliseconds;
                    return LinearProgressIndicator(
                      minHeight: 1,
                      value: progress.isNaN ? 0.0 : progress,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.c1a73e8,
                      ), // Adjust color as needed
                    );
                  },
                ),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(
              color: AppColors.c1a73e8,
            ),
          );
  }

  Widget _buildImageWidget(String imageUrl) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
    );
  }

  void _pauseAllVideos() {
    for (VideoPlayerController controller in _videoControllers) {
      if (controller.value.isPlaying) {
        controller.pause();
      }
    }
  }
}
