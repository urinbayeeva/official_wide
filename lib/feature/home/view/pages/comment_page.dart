import 'package:wide/core/screens/all.dart';

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
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<String> userName = ["Abdulla", "Doston", "Sardor", "Abdulla", "Wide", "Liiil"];
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: _buildTitle(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: AppColors.cefefef, thickness: 1),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(personImages[index]),
                  ),
                  title: Text(userName[index]),
                  subtitle: Text(userComments[index]),
                  trailing: const Text("1 hour ago"),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 64,
            decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1, color: AppColors.cefefef))),
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
                          hintText: '  Fikringizni qoldiring',
                          hintStyle: TextStyle(color: Color(0xFFCFCFD0), fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final commentText = _commentController.text;
                      _commentController.clear();
                    },
                    icon: SvgPicture.asset("assets/icons/profile/send_comment.svg"),
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
            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.bold),
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
