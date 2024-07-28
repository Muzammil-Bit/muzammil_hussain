import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/view/router/routes.dart';
import 'package:muzammil_hussain/view/widgets/app_button.dart';

import '../../../../extensions/context_ext.dart';
import '../../../widgets/section_title.dart';
import '../../experience/experience_page.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        SectionTitle(
          backgroundText: "SKILLS",
          foreGroundText: "EXPERTISE",
          subTitle: "EXPERIENCE",
        ),
        SizedBox(height: 250),
        Container(
          constraints: BoxConstraints(maxWidth: 1500),
          margin: EdgeInsets.symmetric(horizontal: context.isMobile ? 30 : 100),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 100,
            children: [
              ExperienceSection(
                number: "01",
                title: "MOBILE DEV",
                descriptions: [
                  "Dart & Flutter",
                  "MVC MVVM & Bloc",
                  "Third party integrations",
                  "And much more....",
                ],
              ),
              ExperienceSection(
                number: "03",
                title: "BACKEND DEV",
                descriptions: [
                  "PHP & Laravel",
                  "Mysql & Firebase",
                  "PassportJs & JWT",
                  "More in the future..."
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 180),
        AppButton(
          onTap: () => context.go(Routes.experience),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Past Experience",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white)
            ],
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    Key? key,
    required this.number,
    required this.title,
    required this.descriptions,
  }) : super(key: key);
  final String number;
  final String title;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      margin: EdgeInsets.only(left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AutoSizeText(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: context.isMobile ? 28 : 40,
                      height: 0.5,
                    ),
                maxLines: 1,
              ),
              Transform.translate(
                offset: Offset(-10, -30),
                child: AutoSizeText(
                  "$number",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 58,
                        height: 0.5,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Theme.of(context).colorScheme.secondary,
                      ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: context.isMobile ? 30 : 60),
          for (var desc in descriptions) ...[
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    desc,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: context.isMobile ? 12 : 15,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ]
        ],
      ),
    );
  }
}
