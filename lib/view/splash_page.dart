import 'package:flutter/material.dart';
import 'package:muzammil_hussain/config/colors.dart';
import 'package:muzammil_hussain/config/utils/extensions/context_ext.dart';
import 'package:muzammil_hussain/view/home_page.dart';

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
    double lowerBoumd = 0.02;
    double upperBoumd = 1;

    _gradientAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: lowerBoumd,
      upperBound: upperBoumd,
    );
    _gradientAnimation =
        Tween<double>(begin: lowerBoumd, end: upperBoumd).animate(
      CurvedAnimation(
        parent: _gradientAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: lowerBoumd,
      upperBound: upperBoumd,
    );
    _textAnimation =
        Tween<double>(begin: lowerBoumd + 0.3, end: upperBoumd).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeOutBack,
      ),
    );

    _textAnimationController.forward();
    _gradientAnimationController.forward().then((value) async {
      context.push(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
                animation: _gradientAnimation,
                builder: (context, child) {
                  return Container(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        focalRadius: _gradientAnimation.value,
                        radius: _gradientAnimation.value * 1.8,
                        stops: [_gradientAnimation.value, 0.9],
                        colors: [
                          Colors.black,
                          AppColors.secondary,
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: _textAnimation,
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
                          style: TextStyle(color: AppColors.secondary)),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
