import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<String> userName = [
    "Abdulla",
    "Doston",
    "Sardor",
    "Abdulla",
    "Wide",
    "Liiil"
  ];
  List<String> userComments = [
    "At vero eos et accusamus et iusto odio dignissimos ducimus ",
    "At vero eos et accusamus et ?",
    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint o",
    "At vero eos et accusamus et iusto odio dignissimos ducimus ",
    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint o",
    "At vero eos et accusamus et ?"
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: buildAppBar(
          context,
          contentWidget: const Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              "Comment",
              style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          showSearchIcon: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userName.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(personImages[index]),
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName[index],
                              style: const TextStyle(
                                  color: AppColors.c1c1c1c,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              "1 soat",
                              style: TextStyle(
                                  color: AppColors.c1c1c1c,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          userComments[index],
                          style: const TextStyle(
                              color: AppColors.c707071,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(personImages[index]),
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              userName[index],
                              style: const TextStyle(
                                  color: AppColors.c1c1c1c,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              "1 soat",
                              style: TextStyle(
                                  color: AppColors.c1c1c1c,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          userComments[index],
                          style: const TextStyle(
                              color: AppColors.c707071,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 64,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: AppColors.cefefef))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(personImages[0]),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '    Fikringizni qoldiring',
                          hintStyle: TextStyle(
                              color: Color(0xFFCFCFD0),
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final commentText = _commentController.text;
                      _commentController.clear();
                    },
                    icon:
                        SvgPicture.asset("assets/icons/home/send_comment.svg"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppImages.returnIcon),
          ),
          const Spacer(),
          const Text(
            "Comments",
            style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
