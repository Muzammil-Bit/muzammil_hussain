import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../extensions/context_ext.dart';

class OverlappingText extends StatefulWidget {
  const OverlappingText({
    super.key,
    this.offset = const Offset(-10, 10),
    required this.text,
    this.backgroundStyle,
    this.foreGroundStyle,
    this.backgroundText,
  });
  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle;
  final TextStyle? foreGroundStyle;
  final String? backgroundText;

  @override
  State<OverlappingText> createState() => _OverlappingTextState();
}

class _OverlappingTextState extends State<OverlappingText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Entry.all(
          xOffset: -widget.offset.dx,
          yOffset: -widget.offset.dy,
          opacity: 0,
          scale: 1,
          delay: Duration(seconds: 4),
          duration: Constants.mediumDelay,
          child: Transform.translate(
            offset: widget.offset,
            child: AutoSizeText(
              widget.backgroundText ?? widget.text,
              style: widget.backgroundStyle ??
                  Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 120,
                      ),
              maxLines: 1,
            ),
          ),
        ),
        AutoSizeText(
          widget.text,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: widget.foreGroundStyle?.fontSize ?? 120,
              ),
          maxLines: 1,
        ),
      ],
    );
  }
}

class OverlappingHeroText extends StatefulWidget {
  const OverlappingHeroText({
    super.key,
    this.offset = const Offset(-8, 5),
    required this.text,
    this.backgroundStyle,
    this.backgroundText,
    required this.initialXOffset,
    required this.initialYOffset,
  });
  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle;
  final String? backgroundText;
  final double initialXOffset;
  final double initialYOffset;

  @override
  State<OverlappingHeroText> createState() => _OverlappingHeroTextState();
}

class _OverlappingHeroTextState extends State<OverlappingHeroText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Entry.all(
      xOffset: 400,
      yOffset: 300,
      opacity: 0,
      scale: 1,
      curve: Curves.ease,
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 2),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Entry.all(
            xOffset: widget.initialXOffset,
            yOffset: widget.initialYOffset,
            opacity: 0,
            scale: 1,
            delay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 2500),
            curve: Curves.easeInOut,
            child: Transform.translate(
              offset: widget.offset,
              child: Text(
                widget.backgroundText ?? widget.text,
                style: widget.backgroundStyle ??
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: context
                              .getResponsiveValue([70, 80, 120]).toDouble(),
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize:
                      context.getResponsiveValue([70, 80, 120]).toDouble(),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
