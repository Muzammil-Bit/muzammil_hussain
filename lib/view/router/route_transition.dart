import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum SlidePosition { left, right, bottom, top }

class SlideTransitionPage extends CustomTransitionPage {
  final SlidePosition position;
  SlideTransitionPage({
    required Widget child,
    this.position = SlidePosition.top,
  }) : super(
          transitionDuration: position == SlidePosition.top
              ? const Duration(milliseconds: 500)
              : const Duration(milliseconds: 200),
          reverseTransitionDuration: position == SlidePosition.top
              ? const Duration(milliseconds: 500)
              : const Duration(milliseconds: 200),
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset offset = Offset.zero;
            if (position == SlidePosition.top) {
              offset = const Offset(0.0, -1.0);
            } else if (position == SlidePosition.bottom) {
              offset = const Offset(0.0, 1.0);
            } else if (position == SlidePosition.left) {
              offset = const Offset(-1.0, 0.0);
            } else {
              offset = const Offset(1.0, 0.0);
            }
            return SlideTransition(
              position: Tween<Offset>(
                begin: offset,
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: offset,
                ).animate(
                  CurvedAnimation(
                    parent: secondaryAnimation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: child,
              ),
            );
          },
        );
}
