import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../config/assets.dart';
import '../../../../extensions/context_ext.dart';
import '../../../../extensions/theme_ex.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -1900,
          right: -1900,
          bottom: -1900,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  context.theme().colorScheme.secondary,
                  context.theme().scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: context.isMobile ? 20 : 30,
            right: context.isMobile ? 20 : 30,
            bottom: 150,
          ),
          clipBehavior: Clip.none,
          child: Column(
            children: [
              SizedBox(height: 200),
              Divider(
                color: Colors.white,
                height: 2,
              ),
              SizedBox(height: 30),
              context.isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MediaQuery.of(context).size.width < 500
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "DEVELOPED BY",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(height: 10),
                                  CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    radius: 3,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "MUZAMMIL HUSSAIN",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "DEVELOPED BY   ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    radius: 3,
                                  ),
                                  Text(
                                    "   MUZAMMIL HUSSAIN",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FooterIconButton(
                              assetPath: Assets.linkedIn,
                              onTap: () =>
                                  launchUrlString(Constants.linkedInUrl),
                            ),
                            SizedBox(width: 30),
                            _FooterIconButton(
                              assetPath: Assets.x,
                              onTap: () => launchUrlString(Constants.xUrl),
                            ),
                            SizedBox(width: 30),
                            _FooterIconButton(
                              assetPath: Assets.github,
                              onTap: () => launchUrlString(Constants.githubUrl),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "DEVELOPED BY   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              radius: 3,
                            ),
                            Text(
                              "   MUZAMMIL HUSSAIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(width: 10),
                        _FooterIconButton(
                          assetPath: Assets.linkedIn,
                          onTap: () => launchUrlString(Constants.linkedInUrl),
                        ),
                        SizedBox(width: 30),
                        _FooterIconButton(
                          assetPath: Assets.x,
                          onTap: () => launchUrlString(Constants.xUrl),
                        ),
                        SizedBox(width: 30),
                        _FooterIconButton(
                          assetPath: Assets.github,
                          onTap: () => launchUrlString(Constants.githubUrl),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterIconButton extends StatefulWidget {
  const _FooterIconButton({
    required this.assetPath,
    required this.onTap,
  });
  final String assetPath;
  final void Function() onTap;

  @override
  State<_FooterIconButton> createState() => _FooterIconButtonState();
}

class _FooterIconButtonState extends State<_FooterIconButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (val) => setState(() => isHovering = true),
      onExit: (val) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: AnimatedScale(
          scale: isHovering ? 1.2 : 1,
          duration: Duration(milliseconds: 300),
          child: SvgPicture.asset(
            widget.assetPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isHovering
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
