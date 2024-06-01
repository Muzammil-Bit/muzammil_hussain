import 'package:flutter/material.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:muzammil_hussain/view/pages/works/works_page.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../extensions/color_ext.dart';
import '../../providers/app_state_provider.dart';
import 'animated_nav_drawer_button.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Consumer<AppStateProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            AnimatedPositioned(
              top: value.isNavBarOpen ? 0 : -MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 0.6,
                    focal: Alignment.topRight,
                    colors: [
                      Theme.of(context).colorScheme.secondary.darken(0.4),
                      Colors.black
                    ],
                  ),
                ),
                child: AnimatedOpacity(
                  opacity: value.isNavBarOpen ? 1 : 0,
                  duration: Duration(milliseconds: 1500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedNaveItem(
                        title: "Works",
                        onTap: () {
                          context.push(WorksPage());
                        },
                      ),
                      AnimatedNaveItem(
                        title: "About",
                        onTap: () {},
                      ),
                      AnimatedNaveItem(
                        title: "Contact",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              duration: Duration(milliseconds: 1000),
              curve: Curves.ease,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "MH",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 35, letterSpacing: 3),
                      children: [
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  AnimatedNavDrawerButton()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class AnimatedNaveItem extends StatefulWidget {
  const AnimatedNaveItem({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  State<AnimatedNaveItem> createState() => _AnimatedNaveItemState();
}

class _AnimatedNaveItemState extends State<AnimatedNaveItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Constants.mediumAnimationSpeed,
              curve: Curves.ease,
              top: 0,
              bottom: 0,
              left: _isHovered
                  ? 0
                  : -MediaQuery.of(context).size.width * 0.3 - 30,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 0.8,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Constants.mediumAnimationSpeed,
              left: _isHovered ? -40 : 0,
              right: 0,
              top: _isHovered ? -10 : 0,
              curve: Curves.ease,
              child: AnimatedOpacity(
                opacity: _isHovered ? 1 : 0,
                duration: Constants.mediumAnimationSpeed,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        foreground:
                            Constants.outLinedText(context, strokeWidth: 0.001),
                        fontSize: 40,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            MouseRegion(
              onEnter: (event) => setState(() => _isHovered = true),
              onExit: (event) => setState(() => _isHovered = false),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
