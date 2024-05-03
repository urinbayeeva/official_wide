import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/profile/view/pages/language_page.dart';

class AppGoRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", name: "splashPage", builder: (context, state) => const SplashPage()),
      GoRoute(
        path: "/choose",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ChooseLanguage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: "/login",
        name: "/loginPage",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LoginPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: "/registration",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const RegistrationPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
          path: "/rec",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const RecPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
          routes: [
            GoRoute(
                path: "searchPeople",
                name: "search",
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                      child: const SearchPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                          child: child,
                        );
                      });
                })
          ]),
      GoRoute(
        path: "/loginInputNumber",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LoginInputNumber(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(path: "/inputSms", builder: (builder, context) => const LoginInputSms()),
      GoRoute(path: "/newPassword", name: "newPass", builder: (builder, context) => const NewPassword()),
      GoRoute(path: "/inputName", name: "inputName", builder: (builder, context) => const InputName()),
      GoRoute(path: "/inputPass", name: "passInput", builder: (builder, context) => const InputPassword()),
      GoRoute(path: "/homePage", builder: (builder, context) => const HomePage(), routes: [
        GoRoute(
            path: "selectContainer", name: "selectable", builder: (builder, context) => const SelectableContainer()),
        GoRoute(path: "commentPage", name: "comment", builder: (builder, context) => const CommentPage()),
        GoRoute(path: "menuPage", name: "menu", builder: (builder, context) => const MenuPage(), routes: [
          GoRoute(path: "setting", name: "settingPage", builder: (builder, context) => const SettingPage(), routes: [
            GoRoute(path: "statistika", name: "statistikaPage", builder: (builder, context) => const StatisticPage()),
            GoRoute(path: "userInfo", name: "user", builder: (builder, context) => const UserInfo()),
            GoRoute(path: "admin", name: "adminPage", builder: (builder, context) => const UserInfo()),
          ]),
        ]),
      ]),
      GoRoute(path: "/reportPage", name: "report", builder: (builder, context) => const ReportPage()),
      GoRoute(path: "/profilePage", name: "profilePage", builder: (builder, context) => const ProfilePage(), routes: [
        GoRoute(path: "followers", name: "followersPage", builder: (builder, context) => const Followers()),
      ]),
      GoRoute(path: "/saved", name: "savedPage", builder: (builder, context) => const SavedPage()),
      GoRoute(path: "/languagePage", name: "language", builder: (builder, context) => const LanguagePage()),
      GoRoute(path: "/notification", name: "notificationPage", builder: (builder, context) => const NotificationPage()),
      GoRoute(path: "/editProfile", name: "editProfile", builder: (builder, context) => const EditProfile()),
    ],
  );
}
