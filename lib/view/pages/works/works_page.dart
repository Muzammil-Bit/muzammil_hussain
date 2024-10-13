import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:muzammil_hussain/models/project.dart';

import '../../animations/animated_dialog/animated_dialog.dart';
import '../../widgets/nav_bar.dart';
import '../../widgets/section_title.dart';
import '../experience/components/animated_stick.dart';
import '../home/views/footer_view.dart';
import 'components/preview_project_dialog.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> with TickerProviderStateMixin {
  late AnimationController _stickController;

  @override
  void initState() {
    super.initState();

    _stickController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2500))
          ..repeat();
  }

  @override
  void dispose() {
    _stickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          AnimatedNavWrapper(
            child: Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120,
                    child: SectionTitle(
                      backgroundText: "Projects",
                      foreGroundText: "MY PROJECTS",
                      subTitle: "Witness the beauty!",
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Entry.opacity(
                      opacity: 0,
                      duration: Duration(milliseconds: 1500),
                      child: AnimatedSlideBox(
                        controller: _stickController,
                        height: MediaQuery.of(context).size.height * .4,
                        isVertical: true,
                        coverColor: Theme.of(context).colorScheme.primary,
                        boxColor: Colors.white,
                        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
                        width: 6,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
          SizedBox(height: 200),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1024),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: context.isMobile ? 4 : 2,
                    mainAxisCellCount: context.isMobile ? 3 : 3,
                    child: _WorkItem(item: kProjects[0]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: context.isMobile ? 4 : 2,
                    mainAxisCellCount: context.isMobile ? 3 : 3,
                    child: _WorkItem(item: kProjects[1]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: _WorkItem(item: kProjects[2]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: _WorkItem(item: kProjects[3]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: _WorkItem(item: kProjects[4]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: _WorkItem(item: kProjects[5]),
                  ),
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

class _WorkItem extends StatefulWidget {
  const _WorkItem({
    required this.item,
  });
  final Project item;

  @override
  State<_WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<_WorkItem> {
  bool _isHovering = false;
  final animDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: LayoutBuilder(builder: (context, constraints) {
        return InkWell(
          onTap: () => _openDialog(context),
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: _isHovering ? -10 : 0,
                  right: _isHovering ? -10 : 0,
                  bottom: _isHovering ? -10 : 0,
                  top: _isHovering ? -10 : 0,
                  duration: animDuration,
                  child: Image.asset(
                    widget.item.pngPaths.first,
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isHovering ? 1 : 0,
                  duration: animDuration,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6, 1],
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8)
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
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () => _openDialog(context),
                          icon: Icon(Icons.open_with_rounded),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  bottom: _isHovering ? 0 : -120,
                  left: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.item.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontFamily: "Raleway"
                              // color: Colors.black,
                              ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  duration: animDuration,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _openDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      builder: (context) => PreviewProjectDialog(item: widget.item),
    );
  }
}
