import 'package:flutter/material.dart';

import '../../config/utils/extensions/theme_ex.dart';
import 'web/hero_web.dart';
import 'widgets/animated_cursor.dart';

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
              ],
            ),
            ThemeSwitcherWeb(),
          ],
        ),
      ),
    );
  }
}

class ThemeSwitcherWeb extends StatelessWidget {
  const ThemeSwitcherWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 0,
      top: 0,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption(context),
            _buildSpacer(),
            _buildOption(context),
            _buildSpacer(),
            _buildOption(context),
            _buildSpacer(),
            _buildOption(context),
            _buildSpacer(),
            _buildOption(context),
          ],
        ),
      ),
    );
  }

  Container _buildSpacer() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }

  Widget _buildOption(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.theme().colorScheme.secondary,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
