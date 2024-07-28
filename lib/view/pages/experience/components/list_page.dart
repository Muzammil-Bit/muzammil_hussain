import 'package:flutter/material.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:muzammil_hussain/models/experience.dart';
import 'package:muzammil_hussain/view/pages/experience/components/step_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class JobsListView extends StatefulWidget {
  const JobsListView({super.key});

  @override
  State<JobsListView> createState() => _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;

  final Duration duration = Duration(milliseconds: 1000);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration * Experience.ksExperiences.length,
    );
    _textController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: const ValueKey("jobs_list"),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            _controller.forward();
          }
          if (info.visibleFraction < 0.4 && _controller.isCompleted) {
            _controller.reverse();
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: <Widget>[
            ...Experience.ksExperiences.map(
              (exp) {
                int index = Experience.ksExperiences.indexOf(exp);
                double start = index / Experience.ksExperiences.length;
                double end = (index + 1) > Experience.ksExperiences.length
                    ? 10
                    : (index + 1) / Experience.ksExperiences.length;
                return context.getResponsiveValue([
                  MobileExperienceStepCard(
                    experience: exp,
                    index: index + 1,
                    animation: _controller,
                    start: start,
                    end: end,
                  ),
                  MobileExperienceStepCard(
                    experience: exp,
                    index: index + 1,
                    animation: _controller,
                    start: start,
                    end: end,
                  ),
                  ExperienceStepCard(
                    experience: exp,
                    index: index + 1,
                    animation: _controller,
                    start: start,
                    end: end,
                  )
                ]);
              },
            ).toList(),
            SizedBox(height: 20),
          ]),
        ));
  }
}
