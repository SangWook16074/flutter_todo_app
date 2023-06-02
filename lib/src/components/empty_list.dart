import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyList extends StatefulWidget {
  const EmptyList({super.key});

  @override
  State<EmptyList> createState() => _EmptyListState();
}

class _EmptyListState extends State<EmptyList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Lottie.network(
          'https://assets6.lottiefiles.com/private_files/lf30_e3pteeho.json',
          fit: BoxFit.cover),
    );
  }
}
