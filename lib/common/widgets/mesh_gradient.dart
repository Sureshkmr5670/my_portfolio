import 'dart:math' as math;

import 'package:flutter/material.dart';

class MeshGradientBackground extends StatefulWidget {
  final List<Color> colors;
  final Duration duration;
  final Widget? child;

  const MeshGradientBackground({
    Key? key,
    this.colors = const [
      Color(0xFF050B2E),
      Color(0xFF0A1745),
      Color(0xFF0F2355),
      Color(0xFF162F6D),
    ],
    this.duration =
        const Duration(seconds: 20), // Slower movement for more fluid effect
    this.child,
  }) : super(key: key);

  @override
  State<MeshGradientBackground> createState() => _MeshGradientBackgroundState();
}

class _MeshGradientBackgroundState extends State<MeshGradientBackground>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];
  List<Animation<double>> _animations = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize controllers here
      _initializeControllers();

      _animations = _controllers.map((controller) {
        return Tween<double>(
          begin: 0,
          end: 2 * math.pi,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOutSine,
        ));
      }).toList();

      // Staggered starts with varying speeds
      for (var i = 0; i < _controllers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 300), () {
          _controllers[i].repeat(reverse: i % 2 == 0);
        });
      }

      if (mounted) {
        setState(() {});
      }
    });
  }

  void _initializeControllers() {
    _controllers = List.generate(
      6,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: widget.duration.inMilliseconds + (index * 3000)),
      ),
    );

    // Rest of your initialization code
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: Listenable.merge(_controllers),
            builder: (context, child) {
              return CustomPaint(
                painter: WaveMeshGradientPainter(
                  colors: widget.colors,
                  animations: _animations,
                ),
                size: Size.infinite,
              );
            },
          ),
          if (widget.child != null) widget.child!,
        ],
      ),
    );
  }
}

class WaveMeshGradientPainter extends CustomPainter {
  final List<Color> colors;
  final List<Animation<double>> animations;

  WaveMeshGradientPainter({
    required this.colors,
    required this.animations,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..filterQuality = FilterQuality.high
      ..style = PaintingStyle.fill;

    // Create dynamic base gradient
    final baseGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colors[0],
        colors[1],
        colors[2],
        colors[3],
      ],
      stops: [0.0, 0.3, 0.6, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()..shader = baseGradient.createShader(rect),
    );

    // Generate wave points with more natural flow
    void drawWave(int index, double amplitude, double frequency) {
      final path = Path();
      final waveHeight = size.height * amplitude;
      final phase = animations[index].value;

      path.moveTo(0, size.height / 2);

      for (double x = 0; x <= size.width; x += 1) {
        final y = size.height / 2 +
            math.sin(x * frequency / size.width + phase) * waveHeight +
            math.cos(x * (frequency * 0.5) / size.width + phase) *
                (waveHeight * 0.5);

        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colors[index % colors.length].withOpacity(0.3),
          colors[(index + 1) % colors.length].withOpacity(0.0),
        ],
      );

      canvas.drawPath(
        path,
        Paint()
          ..shader = gradient.createShader(rect)
          ..blendMode = BlendMode.plus,
      );
    }

    // Draw multiple overlapping waves
    drawWave(0, 0.3, 2.0);
    drawWave(1, 0.4, 1.5);
    drawWave(2, 0.3, 1.8);
    drawWave(3, 0.5, 1.2);
    drawWave(4, 0.2, 2.2);
    drawWave(5, 0.3, 1.6);

    // Add subtle noise overlay for texture
    final noiseGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.02),
        Colors.white.withOpacity(0.0),
        Colors.black.withOpacity(0.02),
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    paint
      ..shader = noiseGradient.createShader(rect)
      ..blendMode = BlendMode.overlay;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(WaveMeshGradientPainter oldDelegate) => true;
}
