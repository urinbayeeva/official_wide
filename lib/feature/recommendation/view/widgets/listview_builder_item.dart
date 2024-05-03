import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:wide/core/screens/all.dart';
import 'rec_menu_text.dart';

class ListViewBuilderItem extends StatefulWidget {
  final Widget? giveWidget;
  const ListViewBuilderItem({super.key, this.giveWidget});

  @override
  State<ListViewBuilderItem> createState() => _ListViewBuilderItemState();
}

class _ListViewBuilderItemState extends State<ListViewBuilderItem> with TickerProviderStateMixin {
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
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: menuTexts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
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
                  child: widget.giveWidget),
            ));
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
