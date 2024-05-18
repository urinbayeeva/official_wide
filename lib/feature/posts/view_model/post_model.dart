import 'dart:io';

class PostModel {
  final String text;
  final File imagePath;
  final String username;

  PostModel(
      {required this.text, required this.imagePath, required this.username});
}
