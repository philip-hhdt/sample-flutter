import 'package:flutter/material.dart';
import 'package:sample/constants/sizing.dart' as sizing;

class EmptySpace extends StatelessWidget {
  const EmptySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: sizing.kBottomNavigationBarHeight * 3);
  }
}
