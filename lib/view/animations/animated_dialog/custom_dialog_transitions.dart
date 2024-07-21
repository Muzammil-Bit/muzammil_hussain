import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Animates the rotation of a widget.
///
/// Here's an illustration of the [RotationTransition] widget, with it's [turns]
/// animated by a [CurvedAnimation] set to [Curves.elasticOut]:
/// {@animation 300 378 https://flutter.github.io/assets-for-api-docs/assets/widgets/rotation_transition.mp4}
/// See also:
///
///  * [ScaleTransition], a widget that animates the scale of a transformed
///    widget.
///  * [SizeTransition], a widget that animates its own size and clips and
///    aligns its child.
class Rotation3DTransition extends AnimatedWidget {
  /// Creates a rotation transition.
  ///
  /// The [turns] argument must not be null.
  const Rotation3DTransition({
    Key? key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
  }) : super(key: key, listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The alignment of the origin of the coordinate system around which the
  /// rotation occurs, relative to the size of the box.
  ///
  /// For example, to set the origin of the rotation to top right corner, use
  /// an alignment of (1.0, -1.0) or use [Alignment.topRight]
  final Alignment? alignment;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.0006)
      ..rotateY(turnsValue);
    return Transform(
      transform: transform,
      alignment: FractionalOffset(0.5, 0.5),
      child: child,
    );
  }
}

/// Animates the rotation of a widget.
///
/// Here's an illustration of the [RotationTransition] widget, with it's [turns]
/// animated by a [CurvedAnimation] set to [Curves.elasticOut]:
/// {@animation 300 378 https://flutter.github.io/assets-for-api-docs/assets/widgets/rotation_transition.mp4}
/// See also:
///
///  * [ScaleTransition], a widget that animates the scale of a transformed
///    widget.
///  * [SizeTransition], a widget that animates its own size and clips and
///    aligns its child.
class CustomRotationTransition extends AnimatedWidget {
  /// Creates a rotation transition.
  ///
  /// The [turns] argument must not be null.
  const CustomRotationTransition({
    Key? key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
  }) : super(key: key, listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The alignment of the origin of the coordinate system around which the
  /// rotation occurs, relative to the size of the box.
  ///
  /// For example, to set the origin of the rotation to top right corner, use
  /// an alignment of (1.0, -1.0) or use [Alignment.topRight]
  final Alignment? alignment;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.rotationZ(turnsValue * math.pi);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
