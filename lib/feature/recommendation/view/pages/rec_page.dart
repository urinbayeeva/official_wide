import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/recommendation/view/widgets/rec_grid.dart';

class RecPage extends StatefulWidget {
  const RecPage({super.key});

  @override
  State<RecPage> createState() => _RecPageState();
}

class _RecPageState extends State<RecPage> {
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
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [Expanded(flex: 12, child: PostGrid())],
        ));
  }
}
