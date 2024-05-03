import 'package:vibration/vibration.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/recommendation/view/pages/add_navbar.dart';
import 'package:wide/feature/recommendation/view/widgets/rec_menu_text.dart'; // Make sure to import the necessary packages

class RecTabBar extends StatefulWidget {
  final bool showSearchIcon;
  final bool showPlusIcon;
  final bool showDelete;
  final bool showRedCircleDefault;
  final int? indexOfItem;
  final Function(bool)? onRedCirclePressed;

  const RecTabBar(
      {super.key,
      this.showSearchIcon = false,
      this.showPlusIcon = false,
      this.showDelete = false,
      this.showRedCircleDefault = false,
      this.indexOfItem,
      this.onRedCirclePressed});

  @override
  State<RecTabBar> createState() => _RecTabBarState();
}

class _RecTabBarState extends State<RecTabBar> with TickerProviderStateMixin {
  int _pressedIndex = -1;
  bool _isLongPress = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

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
              itemCount: menuTexts.length + (widget.showPlusIcon ? 1 : 0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == menuTexts.length && widget.showPlusIcon) {
                  return GestureDetector(
                    onTap: () {
                      widget.onRedCirclePressed!(true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNavBar(onRedCirclePressed: widget.onRedCirclePressed!)));
                    },
                    child: SvgPicture.asset("assets/icons/home/plus.svg", width: 26, height: 26),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _pressedIndex = index;
                    });
                  },
                  onLongPress: () {
                    Vibration.vibrate(duration: 50);
                    _animationController.forward();
                    setState(() {
                      _isLongPress = true;
                    });
                  },
                  onLongPressCancel: () {
                    _animationController.reverse();
                    setState(() {
                      _isLongPress = false;
                    });
                  },
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(scale: _isLongPress ? _animation.value : 1.0, child: child);
                    },
                    child: AnimatedContainer(
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
                          (widget.showRedCircleDefault || _isLongPress)
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          backgroundColor: Colors.white,
                                          title: Center(
                                            child: Text(
                                              menuTexts[index],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          content: SizedBox(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "At vero eos et accusamus et iusto odio\ndignissimos ducimus qui blanditiis praesentium\nvoluptatum deleniti atque corrupti quos dolor ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 48),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(width: 1, color: Color(0xFFCFCFD0)),
                                                      top: BorderSide(width: 1, color: Color(0xFFCFCFD0)),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          menuTexts.removeAt(index);
                                                          Navigator.pop(context);
                                                        });
                                                      },
                                                      child: const Center(
                                                        child: Text(
                                                          "O'chirish",
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(width: 1, color: Colors.grey),
                                                      top: BorderSide(width: 1, color: Colors.grey),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                                    child: GestureDetector(
                                                      onTap: () => Navigator.pop(context),
                                                      child: const Text(
                                                        "Ortga qaytish",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Image.asset("assets/icons/home/red_circle.png", width: 20, height: 20),
                                )
                              : const SizedBox(),
                          (widget.showRedCircleDefault || _isLongPress) ? const SizedBox(width: 8) : const SizedBox(),
                          Text(
                            menuTexts[index],
                            style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (widget.showSearchIcon)
          IconButton(
            onPressed: () => context.goNamed("search"),
            icon: SvgPicture.asset(AppImages.searchIcon),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
