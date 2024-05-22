import 'package:flutter/material.dart';

import 'views/contact_me.dart';
import 'views/experience_web.dart';
import 'views/footer_view.dart';
import 'views/hero_web.dart';
import 'views/project_process_web.dart';
import 'views/recent_works_view.dart';
import '../../widgets/animated_cursor.dart';
import '../../widgets/theme_switcher_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                HeroView(scrollController: _scrollController),
                ProjectProcessView(),
                ExperienceView(),
                RecentWorksView(),
                ContactMeView(),
                FooterView(),
              ],
            ),
            ThemeSwitcher(),
          ],
        ),
      ),
    );
  }
}
