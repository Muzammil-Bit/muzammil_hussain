import 'package:flutter/material.dart';

import '../../config/utils/extensions/theme_ex.dart';

class HeroWeb extends StatelessWidget {
  const HeroWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter.add(Alignment.topCenter),
                  radius: MediaQuery.of(context).size.width * 0.0006,
                  colors: [
                    context.theme().colorScheme.secondary,
                    context.theme().scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
