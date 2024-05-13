import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/pages/all_page.dart';
import 'package:wide/feature/posts/view/pages/add_post.dart';
import 'core/router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            fontFamily: "Geometria",
            checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        routes: {
          "/homePage": (context) => const HomePage(),
          "/addPost": (context) => const CameraScreen(),
          "/profilePage": (context) => const ProfilePage(),
          "/searchPage": (context) => const RecPage(),
          "/allPage": (context) => const AllPage(),
          'savedPage': (context) => const SavedPage(),
          'settingPage': (context) => const SettingPage(),
          'statistikaPage': (context) => const StatisticPage(),
        },
        initialRoute: "/homePage",
      );
    });
  }
}
