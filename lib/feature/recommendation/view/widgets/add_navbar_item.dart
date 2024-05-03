import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/recommendation/view/widgets/rec_menu_text.dart';

class AddNavBarItem extends StatefulWidget {
  const AddNavBarItem({super.key});

  @override
  State<AddNavBarItem> createState() => _AddNavBarItemState();
}

class _AddNavBarItemState extends State<AddNavBarItem> {
  int _pressedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuTexts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.only(right: 8),
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: _pressedIndex == index ? const Color(0xFF1A73E8) : Colors.transparent,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pressedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(right: 8),
                          duration: const Duration(milliseconds: 200),
                          height: 40,
                          child: SvgPicture.asset(
                            "assets/images/green_plus.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      Text(
                        addNewBar[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
