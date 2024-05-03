import 'package:flutter/material.dart';
import 'package:wide/core/screens/all.dart';

class SelectableContainer extends StatefulWidget {
  final String? text;
  final int? index;

  const SelectableContainer({Key? key, this.text, this.index}) : super(key: key);

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  bool _isSelected = false;
  Color unselectedColor = Colors.white;
  Color selectedColor = const Color(0xFFF7F7F7);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        Navigator.pop(context);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 59,
        color: _isSelected ? selectedColor : unselectedColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                if (widget.index == 0) const Icon(Icons.arrow_back),
                if (widget.index == 0) const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.text!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
