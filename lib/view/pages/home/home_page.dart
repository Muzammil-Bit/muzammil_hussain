import 'package:flutter/material.dart';
import '../../widgets/animated_nav_drawer_button.dart';
import '../../widgets/nav_bar.dart';

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
    return AnimatedCursor(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                HeroView(scrollController: _scrollController),
                RecentWorksView(),
                ExperienceView(),
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
  }
}

// class NavWrapper extends StatelessWidget {
//   const NavWrapper({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: [
//           child,
//           NavBar(),
//         ],
//       ),
//     );
//   }
// }
