import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final Widget? child; // Add a child parameter
  final double? width;
  final double? height;
  final double? borderRadius; // Add a borderRadius parameter

  const GlassBox({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 0), // Default to 0 if null
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    width: width ?? constraints.maxWidth, // Use the parent's width
                    height: height ?? constraints.maxHeight, // Use the parent's height
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius ?? 0), // Default to 0 if null
                      ),
                    ),
                    child: child, // Add the child widget here
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
