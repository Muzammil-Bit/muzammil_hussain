import 'package:flutter/material.dart';
import '../../providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class AnimatedNavDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _animDuration = Duration(milliseconds: 300);
    return Consumer<AppStateProvider>(builder: (context, value, child) {
      final bool _isClicked = value.isNavBarOpen;
      return InkWell(
        onTap: value.toggleNav,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          height: 40,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: _isClicked ? Alignment.center : Alignment.topCenter,
                duration: _animDuration,
                child: AnimatedRotation(
                  duration: _animDuration,
                  turns: _isClicked ? 0.13 : 0,
                  child: Container(
                    width: 40,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              // SizedBox(height: 10),
              AnimatedAlign(
                alignment:
                    _isClicked ? Alignment.center : Alignment.bottomCenter,
                duration: _animDuration,
                child: AnimatedRotation(
                  duration: _animDuration,
                  turns: _isClicked ? -0.13 : 0,
                  child: Container(
                    width: 40,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
