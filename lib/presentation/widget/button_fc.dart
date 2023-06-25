import 'package:flutter/material.dart';

class ButtonFc extends StatelessWidget {
  final VoidCallback onpres;
  final double? elevation;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margen;
  final double? radius;
  final double? height;
  final double? width;
  final Color? Boxcolor;
  final Widget? child;
  final BorderRadius? BoxBorder;

  const ButtonFc(
      {Key? key,
        this.elevation,
        this.splashColor,
        this.Boxcolor=Colors.cyan,
        this.radius=5,
        this.padding,
        this.height=50,
        this.width,
        required this.onpres,
        this.margen, this.child, this.BoxBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: onpres,
      elevation: elevation,
      splashColor: splashColor,
      padding: padding,
      color: Boxcolor,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),

      child: child,
    );
  }
}
