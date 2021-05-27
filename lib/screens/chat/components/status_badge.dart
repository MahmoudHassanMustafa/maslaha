import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final Color color;
  final Widget child;

  const StatusBadge({
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          left: -3,
          top: -1.5,
          child: CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),
        ),
      ],
    );
  }
}
