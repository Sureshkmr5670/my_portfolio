import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedDotsAndLinesBackground extends StatefulWidget {
  @override
  _AnimatedDotsAndLinesBackgroundState createState() => _AnimatedDotsAndLinesBackgroundState();
}

class _AnimatedDotsAndLinesBackgroundState extends State<AnimatedDotsAndLinesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final int dotCount = 10; // Number of dots
  final List<Offset> _dotPositions = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Initialize dot positions
    for (int i = 0; i < dotCount; i++) {
      _dotPositions.add(Offset(
        Random().nextDouble(),
        Random().nextDouble(),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotsAndLinesPainter(_dotPositions, _animation.value),
      child: Container(),
    );
  }
}

class DotsAndLinesPainter extends CustomPainter {
  final List<Offset> dotPositions;
  final double animationValue;

  DotsAndLinesPainter(this.dotPositions, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw lines between dots
    for (int i = 0; i < dotPositions.length; i++) {
      for (int j = i + 1; j < dotPositions.length; j++) {
        final start = Offset(dotPositions[i].dx * size.width, dotPositions[i].dy * size.height);
        final end = Offset(dotPositions[j].dx * size.width, dotPositions[j].dy * size.height);
        canvas.drawLine(start, end, linePaint);
      }
    }

    // Draw dots
    for (final position in dotPositions) {
      final offset = Offset(position.dx * size.width, position.dy * size.height);
      canvas.drawCircle(offset, 5 + 5 * animationValue, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
