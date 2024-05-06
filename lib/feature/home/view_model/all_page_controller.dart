import 'package:flutter_riverpod/flutter_riverpod.dart';

final followedProvider = StateNotifierProvider<FollowedController, bool>(
    (ref) => FollowedController());

class FollowedController extends StateNotifier<bool> {
  FollowedController() : super(false);

  void toggleFollow() {
    state = !state;
  }
}

final likedProvider =
    StateNotifierProvider<LikedController, bool>((ref) => LikedController());

class LikedController extends StateNotifier<bool> {
  LikedController() : super(false);

  void toggleLike() {
    state = !state;
  }
}

final likeCountProvider = StateNotifierProvider<LikeCountController, int>(
    (ref) => LikeCountController());

class LikeCountController extends StateNotifier<int> {
  LikeCountController() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final expandTextProvider = StateNotifierProvider<ExpandTextController, bool>(
    (ref) => ExpandTextController());

class ExpandTextController extends StateNotifier<bool> {
  ExpandTextController() : super(false);

  void toggleExpand() {
    state = !state;
  }
}
