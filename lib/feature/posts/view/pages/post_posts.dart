import 'package:wide/core/screens/all.dart';

class PostPost extends StatefulWidget {
  const PostPost({super.key});

  @override
  State<PostPost> createState() => _PostPostState();
}

class _PostPostState extends State<PostPost> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> postItems = [
      "Boshqalar +",
      "Avtomobillar",
      "Ovqatlar",
      "Darslar",
      "Aksiyalar",
      "Darslar",
      "Kiyimlar",
      "IT",
      "Texnologiya"
    ];

    bool isTapped = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 52,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  AppImages.returnIcon,
                  width: 22,
                  height: 22,
                )),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Joylash",
                style: TextStyle(
                    color: AppColors.c1a73e8,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
              ))))),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: screenWidth * 0.024),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/o.png",
                      scale: 1.2,
                    )),
                SizedBox(width: screenWidth * 0.05),
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.45,
                  child: TextField(
                    controller: _textEditingController,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    cursorColor: AppColors.c1a73e8,
                    decoration: const InputDecoration(
                      hintText: "Izoh qoldiring",
                      hintStyle:
                          TextStyle(color: AppColors.cfcfdf0, fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.cfcfdf0)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.c1a73e8)),
                    ),
                    style: const TextStyle(color: AppColors.c1c1c1c),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: screenHeight * 0.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: postItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      isTapped = !isTapped;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 40,
                      decoration: BoxDecoration(
                        color: postItems[index] == "Boshqalar +"
                            ? const Color(0xff1A73E8)
                            : AppColors.cefefef,
                        borderRadius: BorderRadius.circular(8),
                        border: isTapped
                            ? Border.all(
                                width: 1, color: const Color(0xFF1A73E8))
                            : null,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: Text(
                          postItems[index],
                          style: TextStyle(
                              color: postItems[index] == "Boshqalar +"
                                  ? Colors.white
                                  : AppColors.c1c1c1c,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
