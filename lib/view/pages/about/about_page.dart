import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:muzammil_hussain/view/pages/home/views/footer_view.dart';
import 'package:muzammil_hussain/view/widgets/animated_cursor.dart';
import 'package:muzammil_hussain/view/widgets/nav_bar.dart';
import 'package:muzammil_hussain/view/widgets/section_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      child: Scaffold(
        body: ListView(
          children: [
            AnimatedNavWrapper(
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 200, left: 50, right: 50),
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1024),
                  child: Column(
                    children: [
                      SectionTitle(
                        backgroundText: "ABOUT",
                        foreGroundText: "A Brief History of Muzammil",
                        subTitle: "Bio",
                      ),
                      SizedBox(height: 140),
                      context.isTablet || context.isMobile
                          ? _mobileView(context)
                          : _largeView(context),
                    ],
                  ),
                ),
              ),
            ),
            FooterView(),
          ],
        ),
      ),
    );
  }

  Widget _largeView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Entry.offset(
          yOffset: -400,
          delay: Duration(milliseconds: 300),
          duration: Duration(seconds: 2),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 0.6,
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Colors.white,
                ],
              ),
            ),
            child: Image.asset(
              'assets/images/me.png',
            ),
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          child: Entry.offset(
            yOffset: 400,
            delay: Duration(milliseconds: 300),
            duration: Duration(seconds: 2),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "A BRIEF PROFILE OF MUZAMMIL",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontFamily: "Goku",
                        ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Muzammil Hussain is a mobile application developer based in Pakistan, specializing in Hybrid Mobile Apps Development using Flutter. As a dedicated freelancer, he continually seeks new opportunities to enhance his skills.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Acknowledging that he's on a journey of continuous improvement, Muzammil understands that his earlier projects may not fully reflect his current expertise. Nevertheless, he values the lessons learned from these experiences and views them as opportunities for growth.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "In essence, Muzammil Hussain is a passionate developer committed to excellence. He understands that each project is a chance to become better, welcoming feedback and constructive criticism as stepping stones to further development.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Column _mobileView(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.6,
              colors: [
                Theme.of(context).colorScheme.secondary,
                Colors.white,
              ],
            ),
          ),
          child: Image.asset(
            'assets/images/me.png',
          ),
        ),
        SizedBox(height: 50),
        Text(
          "A BRIEF PROFILE OF MUZAMMIL",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontFamily: "Goku",
              ),
        ),
        SizedBox(height: 10),
        Text(
          "Osama Daimallah is a self-taught developer based in Morocco, specializing in Full-stack development and UI design. As a dedicated freelancer, he continually seeks new opportunities to enhance his skills.",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "Acknowledging that he's on a journey of continuous improvement, Osama understands that his earlier projects may not fully reflect his current expertise. Nevertheless, he values the lessons learned from these experiences and views them as opportunities for growth.",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "In essence, Osama Daimallah is a passionate developer committed to excellence. He understands that each project is a chance to become better, welcoming feedback and constructive criticism as stepping stones to further development.",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
