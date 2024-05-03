import 'package:wide/core/screens/all.dart';

class SendToUser extends StatelessWidget {
  const SendToUser({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> userList = ["Wide", "Wide", "Wide", "Wide"];
    List<String> userPhoto = [
      "assets/images/ava_1.png",
      "assets/images/ava_2.png",
      "assets/images/ava_3.png",
      "assets/images/ava_4.png",
      "assets/images/ava_5.png",
      "assets/images/ava_6.png",
      "assets/images/ava_7.png",
      "assets/images/ava_8.png"
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          userPhoto[index],
                          width: 72,
                          height: 72,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          userList[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
