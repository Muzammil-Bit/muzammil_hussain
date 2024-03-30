import 'package:flutter/material.dart';

import 'web/contact_me.dart';
import 'web/experience_web.dart';
import 'web/footer_web.dart';
import 'web/hero_web.dart';
import 'web/project_process_web.dart';
import 'web/recent_works_web.dart';
import 'widgets/animated_cursor.dart';
import 'widgets/theme_switcher_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                HeroWeb(),
                ProjectProcessWeb(),
                ExperienceWeb(),
                RecentWorksWeb(),
                ContactMe(),
                FooterWeb(),
              ],
            ),
            ThemeSwitcherWeb(),
          ],
        ),
      ),
    );
  }
}
