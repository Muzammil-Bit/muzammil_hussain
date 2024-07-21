import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import '../../extensions/context_ext.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../config/theme.dart';
import '../../providers/app_state_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? _ThemSwitcherMobile() : _ThemeSwitcherWeb();
  }
}

class _ThemeSwitcherWeb extends StatelessWidget {
  const _ThemeSwitcherWeb();

  Widget _buildSpacer() {
    return Transform.scale(
      scale: 2,
      child: Container(
        height: 20,
        width: 1,
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 0,
      top: 0,
      child: Consumer<AppStateProvider>(
        builder: (context, provider, child) {
          return provider.isNavBarOpen
              ? SizedBox.shrink()
              : Entry.all(
                  delay: Constants.smallDelay,
                  xOffset: -20,
                  yOffset: 0,
                  scale: 1,
                  duration: Constants.smallDelay,
                  child: Container(
                    width: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0;
                            i < ThemeConfig.allThemes().length;
                            i++) ...[
                          ThemeToggleButton(
                            color: ThemeConfig.allThemes()[i]
                                .colorScheme
                                .secondary,
                            index: i,
                            isActive: i == provider.currentIndex,
                            onTap: () {
                              context
                                  .read<AppStateProvider>()
                                  .updateThemeIndex(i);
                            },
                          ),
                          if (i < ThemeConfig.allThemes().length - 1)
                            _buildSpacer(),
                        ]
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class _ThemSwitcherMobile extends StatefulWidget {
  const _ThemSwitcherMobile();

  @override
  State<_ThemSwitcherMobile> createState() => _ThemSwitcherMobileState();
}

class _ThemSwitcherMobileState extends State<_ThemSwitcherMobile> {
  bool _isOpened = false;

  Widget _buildSpacer() {
    return Transform.scale(
      scale: 2,
      child: Container(
        height: 20,
        width: 1,
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AppStateProvider>();
    return AnimatedPositioned(
      left: 20,
      bottom: _isOpened ? 30 : 10,
      duration: Duration(milliseconds: 300),
      child: !_isOpened
          ? ThemeToggleButton(
              color: ThemeConfig.allThemes()[0].colorScheme.secondary,
              index: provider.currentIndex,
              isActive: true,
              onTap: () {
                setState(() {
                  _isOpened = !_isOpened;
                });
              },
            )
          : Entry.offset(
              yOffset: 300,
              child: Container(
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;
                        i < ThemeConfig.allThemes().length;
                        i++) ...[
                      ThemeToggleButton(
                        color: ThemeConfig.allThemes()[i].colorScheme.secondary,
                        index: i,
                        isActive: i == provider.currentIndex,
                        onTap: () {
                          context.read<AppStateProvider>().updateThemeIndex(i);
                          setState(() {
                            _isOpened = !_isOpened;
                          });
                        },
                      ),
                      if (i < ThemeConfig.allThemes().length - 1)
                        _buildSpacer(),
                    ]
                  ],
                ),
              ),
            ),
    );
  }
}

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({
    Key? key,
    required this.color,
    required this.isActive,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final int index;
  final bool isActive;
  final void Function() onTap;

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  final Duration animationDuration = Duration(milliseconds: 500);
  bool isHovering = false;

  double _getScale() {
    if (isHovering && widget.isActive) {
      return 3;
    }

    if (widget.isActive) {
      return 1.4;
    }

    if (isHovering) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => setState(() => isHovering = true),
      onExit: (value) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        enableFeedback: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: animationDuration,
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
            padding: EdgeInsets.all(10),
            duration: animationDuration,
            child: AnimatedScale(
              scale: isHovering ? 1 : 1.2,
              duration: animationDuration,
              curve: Curves.ease,
              child: AnimatedScale(
                duration: animationDuration,
                curve: Curves.ease,
                scale: _getScale(),
                child: AnimatedContainer(
                  height: 10,
                  width: 10,
                  // height: _getConstraints(),
                  // width: _getConstraints(),
                  duration: animationDuration,
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    color: ThemeConfig.allThemes()[widget.index]
                        .colorScheme
                        .secondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
