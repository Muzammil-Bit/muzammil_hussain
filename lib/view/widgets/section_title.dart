import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.backgroundText,
    required this.foreGroundText,
  }) : super(key: key);
  final String backgroundText;
  final String foreGroundText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: Offset(-70, -60),
              child: Text(
                backgroundText,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 100,
                      fontFamily: "Goku",
                      height: 0.9,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            Text(
              foreGroundText,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 60,
                    height: 0.5,
                  ),
            ),
          ],
        ),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 50),
                Text("LET'S TALK ABOUT YOUR PROJECT")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
