import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class GlowBackground extends StatelessWidget {
  const GlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark background
        Container(
          color: Colors.black,
        ),
        
        // Yellow Glow - Top Left
        Positioned(
          top: 247,
          left: -100,
          child: _GlowCircle(
            color: AppColors.glowYellow.withOpacity(0.15),
            size: 400,
          ),
        ),
        
        // Cyan Glow - Center Right
        Positioned(
          top: 200,
          right: -150,
          child: _GlowCircle(
            color: AppColors.glowCyan.withOpacity(0.15),
            size: 500,
          ),
        ),
        
        // Pink Glow - Bottom Left/Center
        Positioned(
          bottom: -150,
          left: 50,
          child: _GlowCircle(
            color: AppColors.glowPink.withOpacity(0.15),
            size: 450,
          ),
        ),
        
        // Backdrop Filters for heavy blur
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        
        // Second layer of blur for that extreme smoothness (324px equivalent)
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
          child: Container(
            color: Colors.black.withOpacity(0.2), // Dark overlay to maintain readability
          ),
        ),
      ],
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowCircle({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            color.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
