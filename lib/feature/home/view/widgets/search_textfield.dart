import 'package:wide/core/screens/all.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFF7F7F7)),
      child: const TextField(
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 24),
          hintStyle: TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
