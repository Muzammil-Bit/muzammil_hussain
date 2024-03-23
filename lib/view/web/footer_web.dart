import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muzammil_hussain/config/utils/extensions/theme_ex.dart';

import '../../config/assets.dart';

class FooterWeb extends StatelessWidget {
  const FooterWeb({super.key});

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
          padding: EdgeInsets.only(left: 100, right: 100, bottom: 150),
          clipBehavior: Clip.none,
          child: Column(
            children: [
              SizedBox(height: 200),
              Divider(
                color: Colors.white,
                height: 2,
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "DEVELOPED BY   ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 3,
                  ),
                  Text(
                    "   MUZAMMIL HUSSAIN",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Spacer(),
                  SizedBox(width: 10),
                  _FooterIconButton(assetPath: Assets.linkedIn),
                  SizedBox(width: 30),
                  _FooterIconButton(assetPath: Assets.x),
                  SizedBox(width: 30),
                  _FooterIconButton(assetPath: Assets.github),
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
  });
  final String assetPath;

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
        onTap: () {},
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
