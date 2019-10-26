import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {

  /// Preferred size of this widget for Scaffold
  final double _preferredHeight = 90.0;

  /// Title of the [AnimatedAppBar].
  /// Will be shown on top of the planet.
  final String title;

  AnimatedAppBar(this.title);

  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> with SingleTickerProviderStateMixin {

  /// Main [AnimationController] that will be used to manipulate our animation
  AnimationController _animationController;

  /// Rotation [Animation] that'll be passed to [RotationTransition]
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    /// Initializing our AnimationController
    /// Longer duration means slower rotations and vice versa.
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 180));

    /// Initializing our rotate animation
    /// We use [Curves.linear] so that our animation plays out evenly.
    _rotateAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    /// Telling our animation to repeat indefinitely.
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: ClipRect(
              child: Align(
                heightFactor: 0.18,
                alignment: Alignment.topCenter,
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: Image.asset("assets/img/mars.png"),
                ),
              ),
            ),
          ),

          Text(
            widget.title.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 10.0),
          )
        ],
      ),
    );
  }
}
