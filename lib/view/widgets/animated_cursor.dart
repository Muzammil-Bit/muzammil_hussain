import 'package:flutter/material.dart';
import 'package:muzammil_hussain/view/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/animated_mouse_position_provider.dart';

class AnimatedCursor extends StatelessWidget {
  final Widget? child;

  const AnimatedCursor({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimatedCursorProvider(),
      child: Consumer<AnimatedCursorProvider>(
        child: child,
        builder: (context, provider, child) {
          final state = provider.state;

          return Stack(
            children: [
              if (child != null) child,
              Positioned.fill(
                child: MouseRegion(
                  opaque: false,
                  onHover: (e) => _onCursorUpdate(e, context),
                ),
              ),
              Visibility(
                visible: state.offset != Offset.zero,
                child: AnimatedPositioned(
                  left: state.offset.dx - state.size.width / 2,
                  top: state.offset.dy - state.size.height / 2,
                  width: state.size.width,
                  height: state.size.height,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                      width: state.size.width,
                      height: state.size.height,
                      decoration: state.decoration,
                    ),
                  ),
                ),
              ),
              ResumeDownloadButton(),
              Visibility(
                visible: state.offset != Offset.zero,
                child: AnimatedPositioned(
                  left: state.offset.dx - state.size.width / 16,
                  top: state.offset.dy - state.size.height / 16,
                  width: state.size.width / 10,
                  height: state.size.height / 10,
                  duration: Duration(milliseconds: 50),
                  curve: Curves.decelerate,
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      // decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onCursorUpdate(PointerEvent event, BuildContext context) => context
      .read<AnimatedCursorProvider>()
      .updateCursorPosition(event.position);
}

class AnimatedCursorMouseRegion extends StatefulWidget {
  final Widget? child;
  final BoxDecoration? decoration;

  const AnimatedCursorMouseRegion({Key? key, this.child, this.decoration})
      : super(key: key);

  @override
  _AnimatedCursorMouseRegionState createState() =>
      _AnimatedCursorMouseRegionState();
}

class _AnimatedCursorMouseRegionState extends State<AnimatedCursorMouseRegion> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnimatedCursorProvider>();

    return MouseRegion(
      key: _key,
      opaque: false,
      onHover: (_) => cubit.changeCursor(_key, decoration: widget.decoration),
      onExit: (_) => cubit.resetCursor(),
      child: widget.child,
    );
  }
}
