import 'package:flutter/material.dart';

class AnimatedCursorState {
  static final BoxDecoration kDefaultDecoration = BoxDecoration(
    border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
    shape: BoxShape.circle,
  );

  static const Size kDefaultSize = Size(60, 60);

  late final BoxDecoration decoration;
  final Offset offset;
  final Size size;

  AnimatedCursorState({
    this.offset = Offset.zero,
    this.size = kDefaultSize,
    BoxDecoration? decoration,
  }) {
    this.decoration = decoration ?? kDefaultDecoration;
  }
}

class AnimatedCursorProvider extends ChangeNotifier {
  AnimatedCursorState state = AnimatedCursorState();

  void changeCursor(GlobalKey key, {BoxDecoration? decoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    state = AnimatedCursorState(
      size: renderBox.size,
      offset: renderBox
          .localToGlobal(Offset.zero)
          .translate(renderBox.size.width / 2, renderBox.size.height / 2),
      decoration: decoration ?? AnimatedCursorState.kDefaultDecoration,
    );
    notifyListeners();
  }

  void resetCursor() {
    state = AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset pos) {
    state = AnimatedCursorState(offset: pos);
    notifyListeners();
  }
}
