import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muzammil_hussain/config/assets.dart';
import 'package:muzammil_hussain/models/recent_works.dart';

import '../widgets/section_title.dart';

class RecentWorksWeb extends StatelessWidget {
  const RecentWorksWeb({super.key});

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
          constraints: BoxConstraints(maxWidth: 1000),
          child: GridView.builder(
            itemCount: RecentWork.works.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 100,
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
        alignment:
            widget.isAtTop ? Alignment.topCenter : Alignment.bottomCenter,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight * 0.8,
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
                                    onTap: () {},
                                  ),
                                  SizedBox(width: 10),
                                  ExperienceCardButton(
                                    child: SvgPicture.asset(
                                      Assets.playstore,
                                      width: 16,
                                      height: 16,
                                    ),
                                    onTap: () {},
                                  ),
                                  SizedBox(width: 10),
                                  ExperienceCardButton(
                                    child: SvgPicture.asset(
                                      Assets.playstore,
                                      width: 16,
                                      height: 16,
                                    ),
                                    onTap: () {},
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
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //     fixedSize: MaterialStateProperty.resolveWith(
                    //         (states) => Size(constraints.maxWidth * 0.3, 40)),
                    //     backgroundColor: MaterialStateProperty.resolveWith(
                    //         (states) =>
                    //             Theme.of(context).colorScheme.secondary),
                    //     shape: MaterialStateProperty.resolveWith(
                    //       (states) => RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Live Preview",
                    //     style: Theme.of(context).textTheme.bodyMedium,
                    //   ),
                    // ),
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
    required this.onTap,
  });

  final Widget child;
  final void Function() onTap;

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
          onTap: widget.onTap,
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
