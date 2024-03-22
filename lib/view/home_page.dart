import 'package:flutter/material.dart';
import 'package:muzammil_hussain/config/theme.dart';
import 'package:provider/provider.dart';

import '../../config/utils/extensions/theme_ex.dart';
import '../providers/theme_provider.dart';
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
            for (int i = 0; i < ThemeConfig.allThemes().length; i++) ...[
              _buildOption(context, i),
              if (i < ThemeConfig.allThemes().length - 1) _buildSpacer(),
            ]
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

  Widget _buildOption(BuildContext context, int index) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: provider.getIndex == index
                  ? Colors.white
                  : Colors.transparent,
            ),
          ),
          child: InkWell(
            onTap: () {
              context.read<ThemeProvider>().updateThemeIndex(index);
            },
            child: CircleAvatar(
              radius: 6,
              backgroundColor:
                  ThemeConfig.allThemes()[index].colorScheme.secondary,
            ),
          ),
        );
      },
    );
  }
}
