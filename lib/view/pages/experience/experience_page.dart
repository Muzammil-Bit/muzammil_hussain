import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muzammil_hussain/view/widgets/nav_bar.dart';
import 'package:muzammil_hussain/view/widgets/section_title.dart';

import 'components/animated_stick.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with TickerProviderStateMixin {
  late AnimationController _stickController;

  @override
  void initState() {
    super.initState();

    _stickController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2500))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AnimatedNavWrapper(
            child: Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 120,
                    top: 30,
                    child: Image.asset(
                      "assets/images/working_doodle.png",
                      width: 300,
                      height: 400,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: SectionTitle(
                      backgroundText: "Experience",
                      foreGroundText: "Recent Experience",
                      subTitle: "Awesome!",
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSlideBox(
                      controller: _stickController,
                      height: MediaQuery.of(context).size.height * .4,
                      isVertical: true,
                      coverColor: Theme.of(context).colorScheme.primary,
                      boxColor: Colors.white,
                      visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
                      width: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
