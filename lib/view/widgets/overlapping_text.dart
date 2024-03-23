import 'package:flutter/material.dart';

class OverlappingText extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: offset,
          child: Text(
            backgroundText ?? text,
            style: backgroundStyle ??
                Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 80,
                      height: 0.5,
                    ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: backgroundStyle?.fontSize ?? 80,
                height: 0.5,
              ),
        ),
      ],
    );
  }
}
