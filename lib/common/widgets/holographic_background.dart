import 'dart:math';

import 'package:flutter/material.dart';

class HolographicBackground extends StatefulWidget {
  final Widget child;

  const HolographicBackground({Key? key, required this.child}) : super(key: key);

  @override
  _HolographicBackgroundState createState() => _HolographicBackgroundState();
}

class _HolographicBackgroundState extends State<HolographicBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: HolographicPainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class HolographicPainter extends CustomPainter {
  final double animationValue;

  HolographicPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final shader = RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: [
        Colors.blue,
        Colors.purple,
        Colors.pink,
        Colors.blue,
      ],
      stops: [
        0.0,
        0.3 + 0.2 * sin(animationValue * pi),
        0.7 + 0.2 * cos(animationValue * pi),
        1.0,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()..shader = shader;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(HolographicPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
