import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassFab extends StatelessWidget {
  final void Function()? onPressed;
  const GlassFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.4,
      padding: 0,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: const Text('추가'),
        backgroundColor: Colors.white.withOpacity(0),
      ),
    );
  }
}
