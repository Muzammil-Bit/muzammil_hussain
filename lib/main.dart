import 'package:flutter/material.dart';
import 'package:muzammil_hussain/presentation/configs/colors.dart';
import 'package:muzammil_hussain/presentation/configs/utils/extensions/theme_ex.dart';
import 'package:muzammil_hussain/presentation/pages/splash_page.dart';

void main() {
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muzammil Hussain',
      debugShowCheckedModeBanner: false,
      theme: context.theme(),
      home: const SplashPage(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: "MH",
            children: [
              TextSpan(
                text: ".",
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: TextStyle(fontFamily: "Goku"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(0, -MediaQuery.of(context).size.height * 0.8),
                child: Transform.scale(
                  scale: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        focal: Alignment.center,
                        focalRadius: 0,
                        colors: [
                          AppColors.secondary,
                          AppColors.primary,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 30,
              child: SafeArea(
                child: StackedText(text: "M"),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StackedText(
                      text: "Muzammil",
                      backgroundTextStyle:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.secondary,
                                // fontSize: 40,
                              ),
                      foregroundTextStyle:
                          Theme.of(context).textTheme.titleLarge,
                      // ?.copyWith(fontSize: 40),
                      offset: const Offset(-5, -10),
                    ),
                    Text(
                      "Hussain",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Flutter Developer & Open Source Enthusiast",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                        children: [
                          TextSpan(
                            text:
                                " from Lahore, Pakistan. Been working as a freelancer and tech companies for years with a straight focus on Mobile App Development and FLutter",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedText extends StatelessWidget {
  StackedText(
      {super.key,
      required this.text,
      this.offset = const Offset(-8, 8),
      this.foregroundTextStyle,
      this.backgroundTextStyle});

  final String text;
  final Offset offset;
  TextStyle? foregroundTextStyle;
  TextStyle? backgroundTextStyle;

  @override
  Widget build(BuildContext context) {
    foregroundTextStyle = foregroundTextStyle ??
        Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.white);
    backgroundTextStyle = backgroundTextStyle ??
        Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.secondary);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: Text(
            text,
            style: backgroundTextStyle,
          ),
        ),
        Text(
          text,
          style: foregroundTextStyle,
        ),
      ],
    );
  }
}
