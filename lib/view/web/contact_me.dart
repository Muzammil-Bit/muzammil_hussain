import 'package:flutter/material.dart';
import 'package:muzammil_hussain/view/widgets/dotted_decoration.dart';
import 'package:muzammil_hussain/view/widgets/section_title.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        SectionTitle(
          backgroundText: "Contact",
          foreGroundText: "Contact Me",
        ),
        SizedBox(height: 200),
        ContactMeCard(),
      ],
    );
  }
}

class ContactMeCard extends StatefulWidget {
  const ContactMeCard({super.key});

  @override
  State<ContactMeCard> createState() => _ContactMeCardState();
}

class _ContactMeCardState extends State<ContactMeCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (val) => setState(() => isHovering = true),
      onExit: (val) => setState(() => isHovering = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedRotation(
            duration: Duration(milliseconds: 500),
            turns: isHovering ? 0.2 : 0,
            curve: Curves.ease,
            child: Container(
              width: 500,
              height: 500,
              decoration: DottedDecoration(
                shape: Shape.circle,
                dash: [52],
                strokeWidth: 2,
              ),
              padding: EdgeInsets.all(30),
            ),
          ),
          AnimatedRotation(
            curve: Curves.ease,
            duration: Duration(milliseconds: 500),
            turns: isHovering ? 0.1 : 0,
            child: Container(
              width: 450,
              height: 450,
              decoration: DottedDecoration(
                shape: Shape.circle,
                dash: [10],
                color: Theme.of(context).colorScheme.secondary,
                strokeWidth: 2,
              ),
            ),
          ),
          AnimatedRotation(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            turns: isHovering ? -0.25 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DESIRE FOR A PROJECT\nTHAT ROCKS?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "CONTACT\nMUZAMMIL",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AnimatedRotation(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                  turns: isHovering ? 0.12 : 0,
                  child: Icon(
                    Icons.arrow_outward_rounded,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
