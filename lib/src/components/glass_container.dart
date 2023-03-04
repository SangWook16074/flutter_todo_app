import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  final double opacity;
  const GlassContainer(
      {super.key,
      required this.child,
      required this.padding,
      this.opacity = 0.1});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1.0, color: Colors.white),
              gradient: const LinearGradient(colors: [
                Colors.white,
                Colors.white,
              ])),
          child: child,
        ),
      ),
    );
  }
}
