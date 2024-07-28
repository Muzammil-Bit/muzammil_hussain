import 'package:flutter/material.dart';

import '../../../../extensions/date_ext.dart';
import '../../../../extensions/string_ext.dart';
import '../../../../models/experience.dart';

class ExperienceStepCard extends StatelessWidget {
  const ExperienceStepCard({
    super.key,
    required this.experience,
    required this.index,
    required this.animation,
    required this.start,
    required this.end,
  });
  final Experience experience;
  final Animation<double> animation;
  final double start;
  final double end;
  final int index;

  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Interval(
          start,
          end,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.only(left: 30, bottom: 100);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ThreeDFlip(
                animation: curvedAnimation,
                start: start,
                end: end,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "${"$index".prefixZero()}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "${experience.startDate.toMonthAndYear()} - ${experience.endDate.toMonthAndYear()}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ThreeDFlip(
            animation: curvedAnimation,
            start: start,
            end: end,
            child: Container(
              width: 1,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ThreeDFlip(
              animation: curvedAnimation,
              start: start,
              end: end,
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      experience.company,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.3),
                    ),
                    Text(
                      experience.position,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    if (experience.type == JobType.remote)
                      const Text("(remote)"),
                    SizedBox(height: 30),
                    ...experience.responsibilities
                        .map(
                          (responsibility) => Text(
                            responsibility.prefixDash(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MobileExperienceStepCard extends StatelessWidget {
  const MobileExperienceStepCard({
    super.key,
    required this.experience,
    required this.index,
    required this.animation,
    required this.start,
    required this.end,
  });
  final Experience experience;
  final Animation<double> animation;
  final double start;
  final double end;
  final int index;

  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Interval(
          start,
          end,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.all(10);
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: ThreeDFlip(
                animation: curvedAnimation,
                start: start,
                end: end,
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text(
                    "${"$index".prefixZero()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "${experience.startDate.toMonthAndYear()} - ${experience.endDate.toMonthAndYear()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            AnimatedHorizontalStick(controller: curvedAnimation),
            SizedBox(height: 10),
            ThreeDFlip(
              animation: curvedAnimation,
              start: start,
              end: end,
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      experience.company,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.2),
                    ),
                    Text(
                      experience.position,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    if (experience.type == JobType.remote)
                      const Text("(remote)"),
                    SizedBox(height: 30),
                    ...experience.responsibilities
                        .map(
                          (responsibility) => Text(
                            responsibility.prefixDash(),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ThreeDFlip extends AnimatedWidget {
  const ThreeDFlip({
    super.key,
    required this.animation,
    required this.child,
    required this.start,
    required this.end,
  }) : super(
          listenable: animation,
        );
  final Animation<double> animation;
  final Widget child;
  final double start;
  final double end;

  Animation<double> get transformAnimation =>
      Tween<double>(begin: 1.5, end: 0).animate(
        animation,
      );
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateX(
            transformAnimation.value,
          ),
        child: child,
      ),
    );
  }
}

class AnimatedHorizontalStick extends AnimatedWidget {
  const AnimatedHorizontalStick({
    super.key,
    this.height = 2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double height;
  Animation<double> get width => Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width.value,
      color: Colors.white,
    );
  }
}
