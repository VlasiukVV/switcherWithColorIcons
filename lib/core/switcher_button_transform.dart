import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'switcher_button.dart';

class SwitcherButtonTransform extends StatelessWidget {
  const SwitcherButtonTransform({
    Key key,
    @required this.value,
    @required this.iconOn,
    @required this.iconOff,
    @required this.transitionColor,
    @required this.switcherButtonSize,
    @required this.switcherButtonColor,
    @required this.switcherButtonRadius,
    @required this.switcherButtonOffset,
    @required this.switcherButtonIconSize,
    @required this.switcherButtonAngleTransform,
    this.colorForIconOff,
    this.colorForIconOn,
  }) : super(key: key);

  final double value;
  final IconData iconOn;
  final IconData iconOff;
  final Color transitionColor;
  final double switcherButtonSize;
  final Color switcherButtonColor;
  final double switcherButtonRadius;
  final Offset switcherButtonOffset;
  final double switcherButtonIconSize;
  final double switcherButtonAngleTransform;
  final Color colorForIconOn;
  final Color colorForIconOff;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(switcherButtonOffset.dx * value, switcherButtonOffset.dy),
      child: Transform.rotate(
        angle: lerpDouble(switcherButtonAngleTransform, 2 * pi, value),
        child: Container(
          height: switcherButtonSize,
          width: switcherButtonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: switcherButtonColor,
            borderRadius: BorderRadius.circular(switcherButtonRadius),
          ),
          child: Stack(
            children: <Widget>[
              SwitcherButton(
                value: value,
                isSwitcherOn: false,
                iconOff: iconOff,
                iconOn: iconOn,
                transitionColor: colorForIconOn ?? transitionColor,
                switcherButtonIconSize: switcherButtonIconSize,
              ),
              SwitcherButton(
                value: value,
                isSwitcherOn: true,
                iconOff: iconOff,
                iconOn: iconOn,
                transitionColor: colorForIconOff ?? transitionColor,
                switcherButtonIconSize: switcherButtonIconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
