import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orb {
  double x;
  double y;
  double speedX;
  double speedY;
  double radius;
  Color color;
  double blur;
  double spread;

  Orb({
    required this.x,
    required this.y,
    required this.speedX,
    required this.speedY,
    required this.radius,
    required this.color,
    required this.blur,
    required this.spread,
  });
}

class AnimatedSplashBackground extends StatefulWidget {
  final Widget child;

  const AnimatedSplashBackground({super.key, required this.child});

  @override
  State<AnimatedSplashBackground> createState() =>
      _AnimatedSplashBackgroundState();
}

class _AnimatedSplashBackgroundState extends State<AnimatedSplashBackground>
    with TickerProviderStateMixin {
  final List<Orb> orbs = [];
  late AnimationController _controller;
  late double boundingCircleRadius; // Radius of the big circle
  late double orbRadius; // Radius of each orb

  void initializeOrbs(Size size) {
    orbs.clear();

    // Calculate center of the screen
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Define the big bounding circle's radius
    boundingCircleRadius = math.min(size.width, size.height) * 0.4;

    // Define orb radius so they touch each other and fit inside the bounding circle
    orbRadius = boundingCircleRadius / 3;

    // Initialize the orbs in touching positions
    orbs.addAll([
      Orb(
        x: centerX,
        y: centerY - orbRadius,
        speedX: math.Random().nextDouble() * 2 - 1, // Random speed
        speedY: math.Random().nextDouble() * 2 - 1, // Random speed
        radius: orbRadius,
        color: Colors.purple.withOpacity(0.3),
        blur: 120.r,
        spread: 35.r,
      ),
      Orb(
        x: centerX - orbRadius * math.sqrt(3) / 2,
        y: centerY + orbRadius / 2,
        speedX: math.Random().nextDouble() * 2 - 1,
        speedY: math.Random().nextDouble() * 2 - 1,
        radius: orbRadius,
        color: Colors.blue.withOpacity(0.3),
        blur: 150.r,
        spread: 40.r,
      ),
      Orb(
        x: centerX + orbRadius * math.sqrt(3) / 2,
        y: centerY + orbRadius / 2,
        speedX: math.Random().nextDouble() * 2 - 1,
        speedY: math.Random().nextDouble() * 2 - 1,
        radius: orbRadius,
        color: Colors.pink.withOpacity(0.3),
        blur: 130.r,
        spread: 38.r,
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _controller.addListener(() {
      final size = MediaQuery.of(context).size;
      final centerX = size.width * 0.5;
      final centerY = size.height * 0.5;

      for (var orb in orbs) {
        // Update positions
        orb.x += orb.speedX;
        orb.y += orb.speedY;

        // Calculate distance from center
        double distance = math.sqrt(
          math.pow(orb.x - centerX, 2) + math.pow(orb.y - centerY, 2),
        );

        // If the orb is outside the bounding circle, reflect it back
        if (distance + orb.radius > boundingCircleRadius) {
          double angle = math.atan2(orb.y - centerY, orb.x - centerX);
          orb.x = centerX + (boundingCircleRadius - orb.radius) * math.cos(angle);
          orb.y = centerY + (boundingCircleRadius - orb.radius) * math.sin(angle);
          orb.speedX *= -1;
          orb.speedY *= -1;
        }

        // Add slight speed variation on bounce
        orb.speedX += (math.Random().nextDouble() - 0.5) * 0.1;
        orb.speedY += (math.Random().nextDouble() - 0.5) * 0.1;

        // Normalize speed to prevent acceleration
        double speed = math.sqrt(orb.speedX * orb.speedX + orb.speedY * orb.speedY);
        if (speed > 2.0) {
          orb.speedX = (orb.speedX / speed) * 2.0;
          orb.speedY = (orb.speedY / speed) * 2.0;
        }
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final size = MediaQuery.of(context).size;
    if (orbs.isEmpty) {
      initializeOrbs(size);
    }

    return Stack(
      children: [
        // Background
        Container(
          color: Colors.black,
        ),
        // Orbs with blur effects
        ...orbs.map((orb) => Positioned(
              left: orb.x - orb.radius,
              top: orb.y - orb.radius,
              child: Container(
                width: orb.radius * 2,
                height: orb.radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      orb.color,
                      orb.color.withOpacity(0.3),
                      orb.color.withOpacity(0),
                    ],
                    stops: const [0.2, 0.7, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: orb.color,
                      blurRadius: orb.blur,
                      spreadRadius: orb.spread,
                    ),
                  ],
                ),
              ),
            )),
        // Add backdrops filter for more blur
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        // Content
        widget.child,
      ],
    );
  }
}
