import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/theme.dart';
import '../../providers/theme_provider.dart';

class ThemeSwitcherWeb extends StatelessWidget {
  const ThemeSwitcherWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Positioned(
        left: 20,
        bottom: 0,
        top: 0,
        child: Container(
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < ThemeConfig.allThemes().length; i++) ...[
                ThemeToggleButton(
                  color: ThemeConfig.allThemes()[i].colorScheme.secondary,
                  index: i,
                  isActive: i == provider.currentIndex,
                ),
                if (i < ThemeConfig.allThemes().length - 1) _buildSpacer(),
              ]
            ],
          ),
        ),
      );
    });
  }

  Container _buildSpacer() {
    return Container(
      height: 35,
      width: 1,
      color: Colors.white.withOpacity(0.2),
    );
  }
}

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({
    Key? key,
    required this.color,
    required this.isActive,
    required this.index,
  }) : super(key: key);
  final Color color;
  final bool isActive;
  final int index;

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => setState(() => isHovering = true),
      onExit: (value) => setState(() => isHovering = false),
      child: InkWell(
        onTap: () {
          context.read<ThemeProvider>().updateThemeIndex(widget.index);
        },
        enableFeedback: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: widget.isActive
                ? Border.all(
                    color: Colors.white,
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: AnimatedPadding(
            curve: Curves.ease,
            padding: !widget.isActive || isHovering
                ? EdgeInsets.zero
                : EdgeInsets.all(8),
            duration: Duration(milliseconds: 500),
            child: AnimatedContainer(
              height: _getConstraints(),
              width: _getConstraints(),
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
              decoration: BoxDecoration(
                color:
                    ThemeConfig.allThemes()[widget.index].colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getConstraints() {
    if (isHovering && widget.isActive) {
      return 40;
    }

    if (widget.isActive) {
      return 20;
    }

    if (isHovering) {
      return 20;
    }
    return 14;
  }
}
