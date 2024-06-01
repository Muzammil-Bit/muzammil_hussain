import 'package:flutter/material.dart';

import 'animations/circular_reveal.dart';
import 'pages/home/home_page.dart';
import 'widgets/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _gradientAnimationController;
  late AnimationController _textAnimationController;
  late Animation<double> _gradientAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    double lowerBoumd = 0.0;
    double upperBoumd = 1;

    _gradientAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: lowerBoumd,
      upperBound: upperBoumd,
    );
    _gradientAnimation =
        Tween<double>(begin: lowerBoumd, end: upperBoumd).animate(
      CurvedAnimation(
        parent: _gradientAnimationController,
        curve: Cubic(.14, .59, .84, -0.31),
      ),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: lowerBoumd,
      upperBound: upperBoumd,
    );

    Cubic easeOutBack = Cubic(0.175, 0.9, 0.48, 1.375);
    _textAnimation = Tween<double>(begin: lowerBoumd, end: upperBoumd).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: easeOutBack,
      ),
    );

    _textAnimationController.forward();
    _gradientAnimationController.forward();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).push(CustomPageRoute(HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: Theme.of(context).colorScheme.secondary,
        duration: Duration(milliseconds: 250),
        child: CircularRevealAnimation(
          animation: _gradientAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                    animation: _textAnimation,
                    builder: (context, animation) {
                      return Transform.scale(
                        scale: _textAnimation.value,
                        child: Text.rich(
                          TextSpan(
                            text: "MH",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 80, letterSpacing: 2),
                            children: [
                              TextSpan(
                                  text: ".",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
