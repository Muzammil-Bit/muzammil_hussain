import 'package:flutter/material.dart';

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
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100 * _controller.value),
          child: child!,
        );
      },
      child: Stack(
        children: [
          Transform.translate(
            offset: widget.offset,
            child: Text(
              widget.backgroundText ?? widget.text,
              style: widget.backgroundStyle ??
                  Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 80,
                        height: 0.5,
                      ),
            ),
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: widget.backgroundStyle?.fontSize ?? 80,
                  height: 0.5,
                ),
          ),
        ],
      ),
    );
  }
}
