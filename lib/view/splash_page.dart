import 'package:flutter/material.dart';
import 'package:muzammil_hussain/view/widgets/page_transition.dart';

import '../config/colors.dart';
import '../extensions/context_ext.dart';

import 'animations/circular_reveal.dart';
import 'home_page.dart';

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
        curve: Cubic(0.0, 0.9, 0.8, 0.01),
      ),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: lowerBoumd,
      upperBound: upperBoumd,
    );

    Cubic easeOutBack = Cubic(0.175, 0.9, 0.42, 1.675);
    _textAnimation = Tween<double>(begin: lowerBoumd, end: upperBoumd).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        // curve: easeOutBack,
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

              // Positioned.fill(
              //   child: AnimatedBuilder(
              //       animation: _gradientAnimation,
              //       builder: (context, child) {
              //         return Container(
              //           width: MediaQuery.of(context).size.height,
              //           height: MediaQuery.of(context).size.height,
              //           decoration: BoxDecoration(
              //             gradient: RadialGradient(
              //               focalRadius: _gradientAnimation.value,
              //               radius: _gradientAnimation.value * 1.8,
              //               stops: [_gradientAnimation.value, 0.9],
              //               colors: [
              //                 Colors.black,
              //                 AppColors.secondary,
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // ),
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
