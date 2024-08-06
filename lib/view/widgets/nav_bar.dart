import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/view/pages/experience/experience_page.dart';
import 'package:muzammil_hussain/view/widgets/app_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../config/constants.dart';
import '../../extensions/color_ext.dart';
import '../../providers/app_state_provider.dart';
import '../router/routes.dart';
import 'animated_nav_drawer_button.dart';

class AnimatedNavWrapper extends StatefulWidget {
  const AnimatedNavWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AnimatedNavWrapper> createState() => _AnimatedNavWrapperState();
}

class _AnimatedNavWrapperState extends State<AnimatedNavWrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: Consumer<AppStateProvider>(builder: (context, value, child) {
            return Stack(
              children: [
                AnimatedPositioned(
                  top: value.isNavBarOpen
                      ? 0
                      : -MediaQuery.of(context).size.height,
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
                            title: "Experience",
                            onTap: () {
                              context.go(Routes.experience);
                            },
                          ),
                          AnimatedNaveItem(
                            title: "My Projects",
                            onTap: () {
                              context.go(Routes.works);
                            },
                          ),
                          AnimatedNaveItem(
                            title: "Contact",
                            onTap: () => context.go(Routes.contact),
                          ),
                          AnimatedNaveItem(
                            title: "About",
                            onTap: () => context.go(Routes.about),
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
                      InkWell(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.transparent),
                        onTap: () {
                          context.go(Routes.home);
                        },
                        child: Text.rich(
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedNavDrawerButton()
                    ],
                  ),
                ),
                // ResumeDownloadButton(),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class ResumeDownloadButton extends StatelessWidget {
  const ResumeDownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 40,
      child: Entry(
        yOffset: 100,
        opacity: 0,
        delay: Duration(seconds: 12),
        duration: Duration(seconds: 14),
        child: Consumer<AppStateProvider>(builder: (context, value, child) {
          return AppButton(
            onTap: () {
              launchUrlString(Constants.resumeURl);
            },
            child: Row(
              children: [
                Text(
                  "RESUME",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Raleway",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.download_outlined,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          );
        }),
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 15),
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
                  : -MediaQuery.of(context).size.width * 0.4 - 30,
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
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
                onTap: () {
                  context.read<AppStateProvider>().toggleNav();
                  widget.onTap();
                },
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
