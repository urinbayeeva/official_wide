import 'package:wide/core/screens/all.dart';

class ReelsText extends StatefulWidget {
  final String fullText;
  const ReelsText({super.key, required this.fullText});

  @override
  State<ReelsText> createState() => _ReelsTextState();
}

class _ReelsTextState extends State<ReelsText> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: SizedBox(
        width: 400,
        child: Stack(
          children: [
            Text(
              _expanded ? widget.fullText : _getShortText(),
              textAlign: TextAlign.justify,
              overflow: TextOverflow.fade,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            if (_expanded)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  String _getShortText() {
    return widget.fullText.substring(0, 50);
  }
}
