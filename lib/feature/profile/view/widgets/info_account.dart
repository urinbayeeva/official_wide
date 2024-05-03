import 'package:wide/core/screens/all.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
            width: 363,
            height: 80,
            decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: const Text(
                                    "36",
                                    style:
                                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.c1c1c1c),
                                  ),
                                ),
                                const Text(
                                  "Posts",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF707071)),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => context.goNamed("followersPage"),
                                child: const Text("12K",
                                    style:
                                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.c1c1c1c)),
                              ),
                              const Text(
                                "Followers",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF707071)),
                              ),
                            ],
                          ),
                          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text("98",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.c1c1c1c)),
                            Text(
                              "Followers",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF707071)),
                            )
                          ])
                        ])))));
  }
}
