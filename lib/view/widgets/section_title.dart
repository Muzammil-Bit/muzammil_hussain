import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../config/constants.dart';
import '../../extensions/context_ext.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Entry.opacity(
        duration: Constants.smallDelay,
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
                    offset: context.getResponsiveValue(
                        [Offset(0, -30), Offset(-70, -40), Offset(-70, -50)]),
                    child: AutoSizeText(
                      widget.backgroundText,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                            fontSize: context
                                .getResponsiveValue([60, 80, 100]).toDouble(),
                            fontFamily: "Goku",
                            height: 0.9,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Theme.of(context).colorScheme.secondary,
                          ),
                      maxLines: 1,
                    ),
                  ),
                ),
                AutoSizeText(
                  widget.foreGroundText,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize:
                            context.getResponsiveValue([40, 50, 60]).toDouble(),
                        height: 1,
                      ),
                  maxLines: 2,
                ),
              ],
            ),
            VisibilityDetector(
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 1 &&
                    isVisible == false &&
                    mounted) {
                  setState(() {
                    isVisible = true;
                  });
                } else if (info.visibleFraction == 0 && mounted) {
                  setState(() {
                    isVisible = false;
                  });
                }
              },
              key: ValueKey(widget.subTitle),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: context.isMobile ? 300 : 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: AnimatedContainer(
                            curve: Curves.easeOutCirc,
                            color: Colors.white,
                            duration: Duration(milliseconds: 2000),
                            height: 1,
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
                          curve: Curves.easeOutCirc,
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
    });
  }
}
