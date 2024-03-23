import 'package:flutter/material.dart';

import '../../config/utils/extensions/theme_ex.dart';
import '../widgets/overlapping_text.dart';

class HeroWeb extends StatelessWidget {
  const HeroWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              _bgGradient(context),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "M.U",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "19°C",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "10:50 PM",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.4),
                            width: 4,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            Icons.wb_cloudy_sharp,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: constraints.maxWidth * 0.2,
                top: 100,
                child: OverlappingText(text: "M"),
              ),
              Positioned(
                right: constraints.maxWidth * 0.2,
                bottom: -10,
                child: OverlappingText(text: "Z"),
              ),
              Positioned(
                left: constraints.maxWidth * 0.15,
                bottom: constraints.maxHeight * 0.15,
                child: OverlappingText(
                  text: "U",
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OverlappingText(
                      text: "Muzammil",
                      offset: Offset(-20, -40),
                      backgroundStyle: TextStyle(
                        fontSize: 140,
                        fontFamily: "Goku",
                        height: 0.9,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      "Hussain",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(height: 0.5),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 500,
                      child: Text.rich(
                        TextSpan(
                          text: "Flutter Developer & Open Source Enthusiast",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    " from morocco, been working as a freelancer for years with a straight focus on the web world. Excited for the upcoming opportunities.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _bgGradient(BuildContext context) {
    return Positioned(
      top: -250,
      child: Container(
        height: 800,
        width: MediaQuery.of(context).size.width + 30,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 0.9,
            colors: [
              context.theme().colorScheme.secondary,
              context.theme().scaffoldBackgroundColor,
            ],
          ),
        ),
      ),
    );
  }
}
