import 'package:flutter/material.dart';
import 'package:responsive/logic.dart';
import 'package:vibration/vibration.dart';
import 'package:wide/core/screens/all.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
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
    "assets/videos/abdukarim.mp4",
    "assets/videos/nature.mp4",
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
    "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
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

  double getResponsiveWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 600 ? screenWidth : 800;
  }

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
                          return _buildImageWidget(contentList[index], index);
                        }
                      }))),
          SizedBox(
            width: 90,
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
                        child: SvgPicture.asset("assets/icons/tab_bar/wmw.svg",
                            width: 20, height: 20)),
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
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      constraints: BoxConstraints(
                        maxWidth: getResponsiveWidth(context),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: Column(children: [
                            Container(
                              width: getResponsiveWidth(context),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: AppColors.cefefef))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 24, left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/home/bottomsheet_cancel.svg",
                                      width: 22,
                                      height: 22,
                                    ),
                                    const SearchTextField(),
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/images/home/circle_plus.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(width: 20),
                                        Image.asset(
                                          "assets/images/home/circle_share.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(width: 20),
                                        Image.asset(
                                          "assets/images/home/cirle_link.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                        width: 1,
                                        color: AppColors.cefefef,
                                      ))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/home/top.svg",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 24),
                                child: ListTile(
                                    leading: Image.asset(personImages[0]),
                                    title: const Text("User",
                                        style: TextStyle(
                                            color: AppColors.c1c1c1c,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))))
                          ]),
                        );
                      },
                    );
                  },
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
    double videoWidth = _videoControllers[index].value.size.width;
    double videoHeight = _videoControllers[index].value.size.height;
    return _videoControllers[index].value.isInitialized
        ? Stack(
            fit: StackFit.loose,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    if (isLiked) {
                      likeCount++;
                    } else {
                      likeCount--;
                    }
                    Vibration.vibrate(duration: 50);
                  });
                },
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
                    height: videoHeight,
                    width: videoWidth,
                    child: VideoPlayer(_videoControllers[index])),
              ),
              Positioned(
                top: 14,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 100,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      moreBottomSheet(context);
                    },
                    icon: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        "assets/icons/post/more_icon.svg",
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
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
                        SizedBox(
                          height: 14,
                          width: double.infinity,
                          child: ValueListenableBuilder<VideoPlayerValue>(
                            valueListenable: _videoControllers[index],
                            builder: (context, value, _) {
                              return SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 1.0,
                                  thumbShape: SliderComponentShape.noThumb,
                                  overlayShape: SliderComponentShape.noThumb,
                                  activeTrackColor: AppColors.c1a73e8,
                                  inactiveTrackColor: Colors.white,
                                  trackShape:
                                      const RoundedRectSliderTrackShape(), // Ensure this is set to remove any border around the track
                                ),
                                child: Slider(
                                  value: value.position.inSeconds.toDouble(),
                                  onChanged: (double value) {
                                    if (!_videoControllers[index]
                                        .value
                                        .isPlaying) {
                                      _videoControllers[index].play();
                                    }
                                    _videoControllers[index].seekTo(
                                        Duration(seconds: value.toInt()));
                                  },
                                  onChangeEnd: (double value) {
                                    if (!_videoControllers[index]
                                        .value
                                        .isPlaying) {
                                      _videoControllers[index].pause();
                                    }
                                  },
                                  min: 0.0,
                                  max: value.duration.inSeconds.toDouble(),
                                ),
                              );
                            },
                          ),
                        ),
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
                  duration: const Duration(milliseconds: 200),
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
                      : const SizedBox.shrink(),
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

  Widget _buildImageWidget(String imageUrl, int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isLiked = !isLiked;
              if (isLiked) {
                likeCount++;
              } else {
                likeCount--;
              }
              Vibration.vibrate(duration: 100, amplitude: 200);
            });
          },
          child: Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 12,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 100,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                moreBottomSheet(context);
              },
              icon: RotatedBox(
                quarterTurns: 1,
                child: SvgPicture.asset(
                  "assets/icons/post/more_icon.svg",
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
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
                            backgroundImage: AssetImage(personImages[index]),
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
      ],
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
