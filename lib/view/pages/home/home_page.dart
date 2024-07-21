import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_state_provider.dart';
import '../../splash_page.dart';
import '../../widgets/animated_cursor.dart';
import '../../widgets/theme_switcher_web.dart';
import 'views/contact_me.dart';
import 'views/experience_view.dart';
import 'views/footer_view.dart';
import 'views/hero_view.dart';
import 'views/project_process_web.dart';
import 'views/recent_works_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: !value.isSplashAnimationDone
              ? SplashPage(key: ValueKey(0))
              : Scaffold(
                  body: Stack(
                    children: [
                      ListView(
                        controller: _scrollController,
                        physics: value.isNavBarOpen
                            ? NeverScrollableScrollPhysics()
                            : null,
                        children: [
                          HeroView(scrollController: _scrollController),
                          ExperienceView(),
                          RecentWorksView(),
                          ProjectProcessView(),
                          ContactMeView(),
                          FooterView(),
                        ],
                      ),
                      ThemeSwitcher(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
