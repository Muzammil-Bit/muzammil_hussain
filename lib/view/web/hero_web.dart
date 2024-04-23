import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/constants.dart';
import '../../extensions/theme_ex.dart';
import '../widgets/overlapping_text.dart';

class HeroWeb extends StatefulWidget {
  const HeroWeb({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<HeroWeb> createState() => _HeroWebState();
}

class _HeroWebState extends State<HeroWeb> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  bool animate = false;

  _scrollListener() {
    if (widget.scrollController.offset >= 200 && animate == false) {
      setState(() {
        animate = true;
      });
    } else if (widget.scrollController.offset <= 200 && animate == true) {
      setState(() {
        animate = false;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Duration animDuration = Duration(milliseconds: 200);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              _bgGradient(context),
              _WeatherAndTime(),
              AnimatedPositioned(
                duration: animDuration,
                curve: Curves.easeOut,
                right: constraints.maxWidth * 0.1,
                top: animate ? 300 : 100,
                child: OverlappingHeroText(
                  text: "M",
                  initialXOffset: 200,
                  initialYOffset: 200,
                ),
              ),
              AnimatedPositioned(
                duration: animDuration,
                curve: Curves.easeOut,
                bottom: animate ? 50 : -50,
                right: constraints.maxWidth * 0.2,
                child: OverlappingHeroText(
                  text: "Z",
                  initialXOffset: -200,
                  initialYOffset: 200,
                ),
              ),
              AnimatedPositioned(
                left: 150,
                duration: animDuration,
                curve: Curves.easeOut,
                bottom: animate ? 300 : 150,
                child: OverlappingHeroText(
                  text: "U",
                  initialXOffset: -200,
                  initialYOffset: 200,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Entry.opacity(
                      delay: Constants.delay1,
                      child: OverlappingText(
                        text: "Muzammil",
                        offset: Offset(-20, -40),
                        backgroundStyle: TextStyle(
                          fontSize: 127,
                          fontFamily: "Goku",
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Entry.opacity(
                      delay: Constants.delay1,
                      child: Transform.translate(
                        offset: Offset(0, -20),
                        child: Text(
                          "Hussain",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Entry.opacity(
                      delay: Constants.delay1,
                      duration: Constants.entryAnimationDuration,
                      child: Container(
                        width: 500,
                        child: Text.rich(
                          TextSpan(
                            text: "Flutter Developer & Open Source Enthusiast",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      " from Multan, Pakistan, been working as a freelancer and in tech companies for years with a straight focus on the flutter and mobile world. Excited for the upcoming opportunities.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _bgGradient(BuildContext context) {
    return Positioned(
      top: -250,
      child: Entry.offset(
        yOffset: -500,
        delay: Duration(milliseconds: 4000),
        duration: Duration(seconds: 3),
        child: Container(
          height: 900,
          width: MediaQuery.of(context).size.width + 30,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 0.8,
              stops: [-2, 1],
              colors: [
                context.theme().colorScheme.secondary.withOpacity(0.8),
                context.theme().scaffoldBackgroundColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherAndTime extends StatefulWidget {
  @override
  State<_WeatherAndTime> createState() => _WeatherAndTimeState();
}

class _WeatherAndTimeState extends State<_WeatherAndTime> {
  late final Timer _timer;
  DateTime _now = DateTime.now();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Entry.opacity(
        delay: Constants.delay1,
        duration: Constants.entryAnimationDuration,
        curve: Curves.ease,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "M.U",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(width: 20),
            Text(
              "19°C",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(width: 20),
            AnimatedFlipCounter(
              value: int.parse(DateFormat('hh').format(_now)),
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              " : ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AnimatedFlipCounter(
              value: _now.minute,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              " : ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AnimatedFlipCounter(
              value: _now.second,
              // value: 0,
              textStyle: Theme.of(context).textTheme.bodyLarge,
              hideLeadingZeroes: false,
              wholeDigits: 2,
              curve: Curves.easeInOut,
            ),
            Text(
              "  ${DateFormat('a').format(_now)}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                    width: 4,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.wb_cloudy_sharp,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
