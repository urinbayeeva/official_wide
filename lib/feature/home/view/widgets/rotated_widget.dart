import 'package:wide/core/screens/all.dart';

class RotatedWidget extends StatelessWidget {
  final int? quarterTurns;
  final VoidCallback? onPressed;

  final String? imagePath;
  final double? widht;
  final double? height;
  final String? text;

  const RotatedWidget(
      {super.key, this.onPressed, this.quarterTurns, this.imagePath, this.height, this.widht, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            // height: 32,
            margin: EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              imagePath ?? "",
              width: widht,
              height: height,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text!,
            style: const TextStyle(color: AppColors.c1c1c1c, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
