import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:muzammil_hussain/config/constants.dart';

class OverlappingText extends StatefulWidget {
  const OverlappingText({
    super.key,
    this.offset = const Offset(-10, 10),
    required this.text,
    this.backgroundStyle,
    this.backgroundText,
  });
  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle;
  final String? backgroundText;

  @override
  State<OverlappingText> createState() => _OverlappingTextState();
}

class _OverlappingTextState extends State<OverlappingText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Entry.opacity(
      duration: Constants.entryAnimationDuration,
      delay: Constants.entryDelay,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Entry.all(
            xOffset: -widget.offset.dx,
            yOffset: -widget.offset.dy,
            opacity: 0,
            scale: 1,
            delay: Constants.entryDelay,
            duration: Constants.entryAnimationDuration,
            child: Transform.translate(
              offset: widget.offset,
              child: Text(
                widget.backgroundText ?? widget.text,
                style: widget.backgroundStyle ??
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 80,
                        ),
              ),
            ),
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: widget.backgroundStyle?.fontSize ?? 80,
                ),
          ),
        ],
      ),
    );
  }
}
