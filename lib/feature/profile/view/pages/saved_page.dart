import 'package:wide/core/screens/all.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<String> savedImages = [
    "assets/images/q.png",
    "assets/images/w.png",
    "assets/images/e.png",
    "assets/images/r.png",
    "assets/images/t.png",
    "assets/images/y.png",
    "assets/images/u.png",
    "assets/images/i.png",
    "assets/images/o.png"
  ];

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: _buildTitle(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: AppColors.cefefef, thickness: 1),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: savedImages.length,
        itemBuilder: (context, index) {
          return Image.asset(
            savedImages[index],
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.goNamed("menu"),
            icon: SvgPicture.asset(AppImages.returnIcon),
          ),
          const Spacer(),
          const Text(
            "Saqlanganlar",
            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
