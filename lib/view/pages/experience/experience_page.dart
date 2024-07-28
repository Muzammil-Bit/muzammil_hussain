import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/view/widgets/app_button.dart';

import '../../router/routes.dart';
import '../../widgets/nav_bar.dart';
import '../../widgets/section_title.dart';
import '../home/views/footer_view.dart';
import 'components/animated_stick.dart';
import 'components/list_page.dart';

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
  void dispose() {
    _stickController.dispose();
    super.dispose();
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
                    child: Entry.opacity(
                      opacity: 0,
                      duration: Duration(milliseconds: 1500),
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
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          JobsListView(),
          SizedBox(height: 130),
          Center(
            child: AppButton(
              onTap: () => context.go(Routes.works),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Checkout My Projects",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white)
                ],
              ),
            ),
          ),
          SizedBox(height: 130),
          FooterView(),
        ],
      ),
    );
  }
}
