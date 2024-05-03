import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wide/core/screens/all.dart';
import 'core/router/go_router.dart';

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
      return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppGoRouter.router,
          theme: ThemeData(
              fontFamily: "Geometria",
              checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )));
    });
  }
}
