import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muzammil_hussain/view/pages/home/views/footer_view.dart';
import 'package:muzammil_hussain/view/pages/home/views/recent_works_view.dart';
import 'package:muzammil_hussain/view/widgets/nav_bar.dart';
import 'package:muzammil_hussain/view/widgets/section_title.dart';

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
                  SizedBox(height: 200),
                  SectionTitle(
                    backgroundText: "WORKS",
                    foreGroundText: "RECENT WORKS",
                    subTitle: "WORKS",
                  ),
                  SizedBox(height: 150),
                  WorkItem(),

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

class WorkItem extends StatelessWidget {
  const WorkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
