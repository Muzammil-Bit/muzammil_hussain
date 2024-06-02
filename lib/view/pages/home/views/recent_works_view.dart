import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muzammil_hussain/config/assets.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:muzammil_hussain/models/recent_works.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../widgets/section_title.dart';

class RecentWorksView extends StatelessWidget {
  const RecentWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        SectionTitle(
          backgroundText: "WORKS",
          foreGroundText: "RECENT WORKS",
          subTitle: "WORKS",
        ),
        SizedBox(height: 180),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1024),
          child: GridView.builder(
            itemCount: RecentWork.works.length,
            padding:
                EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 80),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 1 : 2,
              mainAxisSpacing: context.isMobile ? 80 : 100,
              crossAxisSpacing: 80,
            ),
            itemBuilder: (context, index) {
              return WorkCard(
                isAtTop: index % 2 == 0,
                work: RecentWork.works[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class WorkCard extends StatefulWidget {
  const WorkCard({
    super.key,
    required this.isAtTop,
    required this.work,
  });

  final bool isAtTop;
  final RecentWork work;

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: context.isMobile
            ? Alignment.center
            : widget.isAtTop
                ? Alignment.topCenter
                : Alignment.bottomCenter,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: context.isMobile
                ? constraints.maxHeight
                : constraints.maxHeight * 0.8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 3,
              ),
              left: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 3,
              ),
              right: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 3,
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
                child: MouseRegion(
                  onEnter: (v) => setState(() => isHovering = true),
                  onExit: (v) => setState(() => isHovering = false),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            widget.work.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: AnimatedScale(
                          scale: isHovering ? 1 : 1.2,
                          duration: Duration(milliseconds: 200),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: isHovering ? 1 : 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ExperienceCardButton(
                                    child: SvgPicture.asset(
                                      Assets.playstore,
                                      width: 16,
                                      height: 16,
                                    ),
                                    url: widget.work.playStoreUrl,
                                  ),
                                  SizedBox(width: 10),
                                  ExperienceCardButton(
                                    child: SvgPicture.asset(
                                      Assets.apple,
                                      width: 16,
                                      height: 16,
                                    ),
                                    url: widget.work.appStoreUrl,
                                  ),
                                  SizedBox(width: 10),
                                  ExperienceCardButton(
                                    child: SvgPicture.asset(
                                      Assets.github,
                                      width: 16,
                                      height: 16,
                                    ),
                                    url: widget.work.gitHubUrl,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // clipBehavior: Clip.antiAlias,
              ),
              Positioned(
                left: 30,
                top: -15,
                right: 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.work.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class ExperienceCardButton extends StatefulWidget {
  const ExperienceCardButton({
    super.key,
    required this.child,
    required this.url,
  });

  final Widget child;
  final String? url;

  @override
  State<ExperienceCardButton> createState() => _ExperienceCardButtonState();
}

class _ExperienceCardButtonState extends State<ExperienceCardButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isHovering ? 1.1 : 1,
      duration: Duration(milliseconds: 300),
      child: MouseRegion(
        onEnter: (v) => setState(() => isHovering = true),
        onExit: (v) => setState(() => isHovering = false),
        child: InkWell(
          onTap: () {
            if (widget.url != null) {
              launchUrlString(widget.url!);
            }
          },
          mouseCursor: widget.url == null ? SystemMouseCursors.forbidden : null,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
