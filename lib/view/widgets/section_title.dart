import 'dart:developer';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:muzammil_hussain/config/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionTitle extends StatefulWidget {
  const SectionTitle({
    Key? key,
    required this.backgroundText,
    required this.foreGroundText,
    required this.subTitle,
  }) : super(key: key);
  final String backgroundText;
  final String foreGroundText;
  final String subTitle;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
    with TickerProviderStateMixin {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Entry.opacity(
      duration: Constants.entryAnimationDuration,
      child: Column(
        children: [
          Stack(
            children: [
              Entry.all(
                opacity: 0,
                scale: 1,
                xOffset: 60,
                yOffset: 50,
                duration: Duration(seconds: 2),
                delay: Duration(milliseconds: 1500),
                child: Transform.translate(
                  offset: Offset(-70, -60),
                  child: Text(
                    widget.backgroundText,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 100,
                          fontFamily: "Goku",
                          height: 0.9,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ),
              Text(
                widget.foreGroundText,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 60,
                      height: 0.5,
                    ),
              ),
            ],
          ),
          VisibilityDetector(
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1 && isVisible == false) {
                setState(() {
                  isVisible = true;
                });
                log("HELLO");
              } else if (info.visibleFraction == 0) {
                setState(() {
                  isVisible = false;
                });
              }
            },
            key: ValueKey(widget.subTitle),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          color: Colors.white.withOpacity(0.4),
                          duration: Duration(milliseconds: 800),
                          height: 0.5,
                          width: isVisible ? 400 : 0,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    AnimatedOpacity(
                      opacity: isVisible ? 1 : 0,
                      duration: Duration(milliseconds: 500),
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOutBack,
                        offset: isVisible ? Offset(0, 0) : Offset(2, 0),
                        child: Text(widget.subTitle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
