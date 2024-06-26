import 'dart:async';
import 'dart:developer';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../config/constants.dart';
import '../../../../extensions/context_ext.dart';
import '../../../../extensions/theme_ex.dart';
import '../../../widgets/nav_bar.dart';
import '../../../widgets/overlapping_text.dart';

class HeroView extends StatefulWidget {
  const HeroView({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<HeroView> createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  bool _isScrolled = false;

  _scrollListener() {
    if (widget.scrollController.offset >= 200 && _isScrolled == false) {
      setState(() {
        _isScrolled = true;
      });
    } else if (widget.scrollController.offset <= 200 && _isScrolled == true) {
      setState(() {
        _isScrolled = false;
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
    final Duration _animDuration = Duration(milliseconds: 200);
    return AnimatedNavWrapper(
      child: Container(
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
                  duration: _animDuration,
                  curve: Curves.easeOut,
                  right: context.isMobile ? 100 : constraints.maxWidth * 0.1,
                  top: _isScrolled ? 300 : 100,
                  child: Opacity(
                    opacity: 0.8,
                    child: OverlappingHeroText(
                      text: "M",
                      initialXOffset: 200,
                      initialYOffset: 200,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _animDuration,
                  curve: Curves.easeOut,
                  bottom: _isScrolled ? -100 : -50,
                  right: constraints.maxWidth * 0.2,
                  child: OverlappingHeroText(
                    text: "Z",
                    initialXOffset: -200,
                    initialYOffset: 200,
                  ),
                ),
                AnimatedPositioned(
                  left: context.isMobile ? 30 : 150,
                  duration: _animDuration,
                  curve: Curves.easeOut,
                  bottom: _isScrolled
                      ? 300
                      : context.isMobile
                          ? 300
                          : 150,
                  child: OverlappingHeroText(
                    text: "U",
                    initialXOffset: -200,
                    initialYOffset: 200,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Entry.opacity(
                          delay: Constants.smallDelay,
                          child: OverlappingText(
                            text: "Muzammil",
                            offset: Offset(-_heroTitleFontSize(context) / 3,
                                -_heroTitleFontSize(context) / 3),
                            foreGroundStyle: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontSize: _heroTitleFontSize(context),
                                ),
                            backgroundStyle: TextStyle(
                              fontSize: _heroTitleFontSize(context),
                              fontFamily: "Goku",
                              foreground: Constants.outLinedText(context),
                            ),
                          ),
                        ),
                        Entry.opacity(
                          delay: Constants.smallDelay,
                          child: Transform.translate(
                            offset: Offset(0, -20),
                            child: AutoSizeText(
                              "Hussain",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(

                                      // fontSize: _heroTitleFontSize(context),
                                      ),
                              maxLines: 1,
                              maxFontSize: _heroTitleFontSize(context),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Entry.opacity(
                          delay: Constants.smallDelay,
                          duration: Constants.smallDelay,
                          child: Container(
                            width: 500,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "Flutter Developer & Open Source Enthusiast",
                                style: TextStyle(
                                  fontSize: context.isDeskTop ? 16 : 14,
                                  fontWeight: FontWeight.w800,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          ", been working as a freelancer and in tech companies for years with a straight focus on the flutter and mobile world. Excited for the upcoming opportunities.",
                                      style: TextStyle(
                                        fontSize: context.isDeskTop ? 16 : 12,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 9,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double _heroTitleFontSize(BuildContext context) {
    if (context.isTablet) {
      return 100;
    }
    if (context.isMobile) {
      return 80;
    }

    return 127;
  }

  Widget _bgGradient(BuildContext context) {
    return Positioned(
      top: context.isMobile ? -40 : -250,
      child: Opacity(
        opacity: 0.6,
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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Entry.opacity(
        delay: Constants.smallDelay,
        duration: Constants.smallDelay,
        curve: Curves.ease,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!context.isMobile) ...[
              Text(
                "M.U",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(width: 20),
            ],
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
