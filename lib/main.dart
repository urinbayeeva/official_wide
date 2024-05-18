import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wide/core/screens/all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
          "/splashPage": (context) => const SplashPage(),
          "/homePage": (context) => const HomePage(
                currentIndex: 3,
              ),
          "/addPost": (context) => const CameraScreen(),
          "/profilePage": (context) => const ProfilePage(),
          "/searchPage": (context) => const RecPage(),
          "/allPage": (context) => const AllPage(),
          '/savedPage': (context) => const SavedPage(),
          '/settingPage': (context) => const SettingPage(),
          '/statistikaPage': (context) => const StatisticPage(),
        },
        initialRoute: "/splashPage",
      );
    });
  }
}
