import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class ExperienceWeb extends StatelessWidget {
  const ExperienceWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        SectionTitle(
          backgroundText: "EXPERIENCE",
          foreGroundText: "INFORMATION TECHNOLOGY",
          subTitle: "EXPERIENCE",
        ),
        SizedBox(height: 250),
        Container(
          constraints: BoxConstraints(maxWidth: 1500),
          margin: EdgeInsets.symmetric(horizontal: 100),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 100,
            children: [
              ExperienceSection(
                number: "01",
                title: "UI DESIGN",
                descriptions: [
                  "UI Design",
                  "Web & Mobile",
                  "Figma & photoshop and illustrator",
                  "More in the future...",
                ],
              ),
              ExperienceSection(
                number: "02",
                title: "FRONT END DEV",
                descriptions: [
                  "html & css (tailwindCss)",
                  "javascript & React",
                  "nextjs & Redux Toolkit",
                  "Splide & Swiper and Framer Motion",
                  "More in the future...",
                ],
              ),
              ExperienceSection(
                number: "03",
                title: "BACKEND DEV",
                descriptions: [
                  "NodeJs & Express",
                  "MongoDB (Mongoose) & Firebase",
                  "PassportJs & JWT",
                  "More in the future..."
                ],
              ),
            ],
          ),
        )
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 40,
                      height: 0.5,
                    ),
              ),
              Transform.translate(
                offset: Offset(-10, -30),
                child: Text(
                  "$number",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 58,
                        height: 0.5,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
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
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
