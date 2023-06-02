import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final void Function()? onPressed;
  const GradientButton(
      {super.key,
      required this.width,
      required this.height,
      this.child,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed!,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 12, 0, 49),
                Color.fromARGB(255, 12, 0, 91),
                Color.fromARGB(255, 12, 0, 120),
              ],
            )),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
