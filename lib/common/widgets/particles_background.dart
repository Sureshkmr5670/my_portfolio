import 'dart:math';

import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  @override
  _ParticleBackgroundState createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random random = Random();
  final List<Offset> particleOffsets = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Generate initial particle positions
    for (int i = 0; i < 100; i++) {
      particleOffsets.add(Offset(
        random.nextDouble() * MediaQuery.of(context).size.width,
        random.nextDouble() * MediaQuery.of(context).size.height,
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            animationValue: _controller.value,
            particles: particleOffsets,
          ),
          child: Container(),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;
  final List<Offset> particles;
  final Random random = Random();

  ParticlePainter({required this.animationValue, required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.purpleAccent.withOpacity(0.7);

    for (var offset in particles) {
      final dx = offset.dx + sin(animationValue * 2 * pi) * 5;
      final dy = offset.dy + cos(animationValue * 2 * pi) * 5;

      canvas.drawCircle(
        Offset(dx, dy),
        random.nextDouble() * 3 + 2, // Random particle size
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
