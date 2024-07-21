import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_dialog_transitions.dart';

///Is dialog showing
bool isShowing = false;

enum DialogTransitionType {
  ///Fade animation
  fade,

  ///Slide from top animation
  slideFromTop,

  ///Slide from top fade animation
  slideFromTopFade,

  ///Slide from bottom animation
  slideFromBottom,

  ///Slide from bottom fade animation
  slideFromBottomFade,

  ///Slide from left animation
  slideFromLeft,

  ///Slide from left fade animation
  slideFromLeftFade,

  ///Slide from right animation
  slideFromRight,

  ///Slide from right fade animation
  slideFromRightFade,

  ///Scale animation
  scale,

  ///Fade scale animation
  fadeScale,

  ///Rotation animation
  rotate,

  ///Scale rotate animation
  scaleRotate,

  ///Fade rotate animation
  fadeRotate,

  ///3D Rotation animation
  rotate3D,

  ///Size animation
  size,

  ///Size fade animation
  sizeFade,

  ///No animation
  none,
}

/// Displays a Material dialog above the current contents of the app
Future<T?> showAnimatedDialog<T extends Object?>({
  required BuildContext context,
  bool barrierDismissible = false,
  required WidgetBuilder builder,
  animationType = DialogTransitionType.size,
  Curve curve = Curves.linear,
  Duration? duration,
  Alignment alignment = Alignment.center,
  Color? barrierColor,
  Axis? axis = Axis.horizontal,
}) {
  assert(debugCheckHasMaterialLocalizations(context));

  final ThemeData theme = Theme.of(context);

  isShowing = true;
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        top: false,
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor ?? Colors.black54,
    transitionDuration: duration ?? const Duration(milliseconds: 400),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      switch (animationType) {
        case DialogTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case DialogTransitionType.slideFromRight:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromLeft:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromRightFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        case DialogTransitionType.slideFromLeftFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        case DialogTransitionType.slideFromTop:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromTopFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        case DialogTransitionType.slideFromBottom:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromBottomFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        case DialogTransitionType.scale:
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.00,
                0.50,
                curve: curve,
              ),
            ),
            child: child,
          );
        case DialogTransitionType.fadeScale:
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.00,
                0.50,
                curve: curve,
              ),
            ),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: child,
            ),
          );
        case DialogTransitionType.scaleRotate:
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.00,
                0.50,
                curve: curve,
              ),
            ),
            child: CustomRotationTransition(
              alignment: alignment,
              turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                  parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
              child: child,
            ),
          );
        case DialogTransitionType.rotate:
          return CustomRotationTransition(
            alignment: alignment,
            turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
            child: child,
          );
        case DialogTransitionType.fadeRotate:
          return CustomRotationTransition(
            alignment: alignment,
            turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: child,
            ),
          );
        case DialogTransitionType.rotate3D:
          return Rotation3DTransition(
            alignment: alignment,
            turns: Tween<double>(begin: math.pi, end: 2.0 * math.pi).animate(
                CurvedAnimation(
                    parent: animation,
                    curve: Interval(0.0, 1.0, curve: curve))),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation,
                      curve: Interval(0.5, 1.0, curve: Curves.elasticOut))),
              child: child,
            ),
          );
        case DialogTransitionType.size:
          return Align(
            alignment: alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              axis: axis ?? Axis.vertical,
              child: child,
            ),
          );
        case DialogTransitionType.sizeFade:
          return Align(
            alignment: alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: curve,
                ),
                child: child,
              ),
            ),
          );
        case DialogTransitionType.none:
          return child;
        default:
          return FadeTransition(opacity: animation, child: child);
      }
    },
  );
}

///
///created time: 2019-07-19 14:35
///author linzhiliang
///version 1.0
///since
///file name: animated_dialog.dart
///description: Custom dialog widget
///
class CustomDialogWidget extends StatelessWidget {
  /// Creates an alert dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  ///
  /// The [contentPadding] must not be null. The [titlePadding] defaults to
  /// null, which implies a default that depends on the values of the other
  /// properties. See the documentation of [titlePadding] for details.
  const CustomDialogWidget({
    Key? key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.bottomWidget,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.minWidth,
  })  : assert(contentPadding != null),
        super(key: key);

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry? titlePadding;

  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used, if that's null, defaults to
  /// [ThemeData.textTheme.title].
  final TextStyle? titleTextStyle;

  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [AlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit.
  final Widget? content;

  /// Padding around the content.
  ///
  /// If there is no content, no padding will be provided. Otherwise, padding of
  /// 20 pixels is provided above the content to separate the content from the
  /// title, and padding of 24 pixels is provided on the left, right, and bottom
  /// to separate the content from the other edges of the dialog.
  final EdgeInsetsGeometry? contentPadding;

  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used, if that's null, defaults
  /// to [ThemeData.textTheme.subhead].
  final TextStyle? contentTextStyle;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  ///
  /// Typically this is a list of [TextButton] widgets.
  ///
  /// These widgets will be wrapped in a [ButtonBar], which introduces 8 pixels
  /// of padding on each side.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [ButtonBar] to separate the [title]
  /// from the [actions].
  final List<Widget>? actions;

  ///Widget in the bottom
  final Widget? bottomWidget;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// If this label is not provided, a semantic label will be inferred from the
  /// [title] if it is not null.  If there is no title, the label will be taken
  /// from [MaterialLocalizations.alertDialogLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.isRouteName], for a description of how this
  ///    value is used.
  final String? semanticLabel;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  ///Min width
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: (titleTextStyle ??
              dialogTheme.titleTextStyle ??
              theme.textTheme.bodyLarge)!,
          child: Semantics(
            child: title,
            namesRoute: true,
            container: true,
          ),
        ),
      ));
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ??
              MaterialLocalizations.of(context).alertDialogLabel;
          break;
        case TargetPlatform.linux:
          label = semanticLabel ??
              MaterialLocalizations.of(context).alertDialogLabel;
          break;
        case TargetPlatform.macOS:
          label = semanticLabel;
          break;
        case TargetPlatform.windows:
          label = semanticLabel ??
              MaterialLocalizations.of(context).alertDialogLabel;
          break;
      }
    }

    if (content != null) {
      children.add(
        Flexible(
          child: Padding(
            padding: contentPadding!,
            child: DefaultTextStyle(
              style: (contentTextStyle ??
                  dialogTheme.contentTextStyle ??
                  theme.textTheme.bodySmall)!,
              child: content!,
            ),
          ),
        ),
      );
    }

    if (bottomWidget != null) {
      children.add(bottomWidget!);
    } else if (actions != null) {
      children.add(
        ButtonBarTheme(
          data: ButtonBarTheme.of(context),
          child: ButtonBar(
            children: actions!,
          ),
        ),
      );
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );

    dialogChild = CustomDialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      minWidth: minWidth,
      shape: shape,
      child: dialogChild,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
        child: dialogChild);
  }
}

/// A material design dialog.
///
/// This dialog widget does not have any opinion about the contents of the
/// dialog. Rather than using this widget directly, consider using [AlertDialog]
/// or [SimpleDialog], which implement specific kinds of material design
/// dialogs.
///
/// See also:
///
///  * [AlertDialog], for dialogs that have a message and some buttons.
///  * [SimpleDialog], for dialogs that offer a variety of options.
///  * [showDialog], which actually displays the dialog and returns its result.
///  * <https://material.io/design/components/dialogs.html>
class CustomDialog extends StatelessWidget {
  /// Creates a dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const CustomDialog({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.minWidth = 280.0,
    this.shape,
    this.child,
  }) : super(key: key);

  /// {@template flutter.material.dialog.backgroundColor}
  /// The background color of the surface of this [Dialog].
  ///
  /// This sets the [Material.color] on this [Dialog]'s [Material].
  ///
  /// If `null`, [ThemeData.cardColor] is used.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template flutter.material.dialog.elevation}
  /// The z-coordinate of this [Dialog].
  ///
  /// If null then [DialogTheme.elevation] is used, and if that's null then the
  /// dialog's elevation is 24.0.
  /// {@endtemplate}
  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to 100 milliseconds.
  final Duration? insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve? insetAnimationCurve;

  ///Min width of the dialog
  final double? minWidth;

  /// {@template flutter.material.dialog.shape}
  /// The shape of this dialog's border.
  ///
  /// Defines the dialog's [Material.shape].
  ///
  /// The default shape is a [RoundedRectangleBorder] with a radius of 2.0.
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  // TODO(johnsonmh): Update default dialog border radius to 4.0 to match material spec.
  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration!,
      curve: insetAnimationCurve!,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: minWidth ?? 280.0),
            child: Material(
              color: backgroundColor ??
                  dialogTheme.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
