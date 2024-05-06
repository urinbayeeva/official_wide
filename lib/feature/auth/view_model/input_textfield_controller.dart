import '../../../core/screens/all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var textFieldRef =
    ChangeNotifierProvider<TextFieldNotifier>((ref) => TextFieldNotifier());

class TextFieldNotifier extends ChangeNotifier {
  bool isShowing = false;

  void showPassword() {
    isShowing = !isShowing;
    notifyListeners();
  }
}
