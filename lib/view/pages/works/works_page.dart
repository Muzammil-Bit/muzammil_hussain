import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../widgets/nav_bar.dart';
import '../../widgets/section_title.dart';
import '../home/views/footer_view.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AnimatedNavWrapper(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  SizedBox(height: 180),
                  SectionTitle(
                    backgroundText: "WORKS",
                    foreGroundText: "RECENT WORKS",
                    subTitle: "WORKS",
                  ),
                  SizedBox(height: 150),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1140),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return WorkItem();
                      },
                    ),
                  ),
                  // WorkItem(),

                  // RecentWorksView(),
                ],
              ),
            ),
          ),
          FooterView(),
        ],
      ),
    );
  }
}

class WorkItem extends StatefulWidget {
  const WorkItem({super.key});

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    final animDuration = Duration(milliseconds: 500);

    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          AnimatedPositioned(
            left: _isHovering ? -30 : 0,
            right: _isHovering ? -30 : 0,
            bottom: _isHovering ? -30 : 0,
            top: _isHovering ? -30 : 0,
            duration: animDuration,
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            opacity: _isHovering ? 1 : 0,
            duration: animDuration,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AnimatedOpacity(
              opacity: _isHovering ? 1 : 0,
              duration: animDuration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      showAnimatedDialog(
                        context: context,
                        barrierDismissible: true,
                        animationType: DialogTransitionType.slideFromBottomFade,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 500),
                        builder: (context) => PreviewProjectDialog(),
                      );
                    },
                    icon: Icon(Icons.open_with_rounded),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: _isHovering ? 0 : -120,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "SyncWell",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontFamily: "Raleway"
                            // color: Colors.black,
                            ),
                  ),
                ],
              ),
            ),
            duration: animDuration,
          )
        ],
      ),
    );
  }
}

class PreviewProjectDialog extends StatelessWidget {
  const PreviewProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      content: Container(
        constraints: BoxConstraints(maxWidth: 1024),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              blurRadius: 14,
            ),
          ],
          color: Colors.black,
        ),
        height: 600,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "SynWell",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 38),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.apple,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.polyline_sharp,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.white,
                height: 30,
              ),
              SizedBox(height: 40),
              Text(
                "Syncwell is a health tracking app built on top of Apple's Health kit and Google fit.",
              ),
              SizedBox(height: 20),
              GridView.builder(
                itemBuilder: (context, index) => Container(
                  color: Colors.red,
                ),
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 450 ? 1 : 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  childAspectRatio: 9 / 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
