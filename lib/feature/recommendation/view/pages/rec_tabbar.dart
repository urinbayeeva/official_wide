import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibration/vibration.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/recommendation/view/widgets/rec_menu_text.dart';

class RecTabBar extends StatefulWidget {
  final bool showSearchIcon;
  final bool showPlusIcon;
  final bool showDelete;
  final bool showRedCircleDefault;
  final int? indexOfItem;
  final Function(bool)? onRedCirclePressed;

  const RecTabBar({
    super.key,
    this.showSearchIcon = false,
    this.showPlusIcon = false,
    this.showDelete = false,
    this.showRedCircleDefault = false,
    this.indexOfItem,
    this.onRedCirclePressed,
  });

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
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: screenHeight * 0.1,
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
                          builder: (context) => AddNavBar(
                            onRedCirclePressed: widget.onRedCirclePressed!,
                          ),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddNavBar())),
                      child: Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.01),
                        width: screenHeight * 0.1,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            weight: 600,
                            Icons.add,
                            size: screenWidth * 0.025,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
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
                      return Transform.scale(
                        scale: _isLongPress ? _animation.value : 1.0,
                        child: child,
                      );
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(right: screenWidth * 0.01),
                      duration: const Duration(milliseconds: 200),
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: _pressedIndex == index
                              ? const Color(0xFF1A73E8)
                              : Colors.transparent,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.018,
                        vertical: screenHeight * 0.01,
                      ),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "At vero eos et accusamus et iusto odio\ndignissimos ducimus qui blanditiis praesentium\nvoluptatum deleniti atque corrupti quos dolor ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: AppColors.c707071,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 48),
                                                Container(
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFCFCFD0)),
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFCFCFD0)),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 16),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          menuTexts
                                                              .removeAt(index);
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: const Center(
                                                        child: Text(
                                                          "O'chirish",
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12, bottom: 12),
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: const Center(
                                                      child: Text(
                                                        "Ortga qaytish",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.c1c1c1c,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                  child: Image.asset(
                                    "assets/icons/home/red_circle.png",
                                    width: screenWidth * 0.025,
                                    height: screenWidth * 0.025,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          (widget.showRedCircleDefault || _isLongPress)
                              ? SizedBox(width: screenWidth * 0.0050)
                              : const SizedBox.shrink(),
                          Text(
                            menuTexts[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
            icon: SvgPicture.asset(AppImages.searchIcon, width: 24, height: 24),
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
