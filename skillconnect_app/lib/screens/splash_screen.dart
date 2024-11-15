import 'dart:math';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Topographical pattern background
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 63, 79, 216), // Adjust this blue color as needed
            ),
            child: CustomPaint(
              painter: TopographicalPainter(),
              size: Size.infinite,
            ),
          ),
          // White curved overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: CurvedOverlayPainter(),
              size: const Size(double.infinity, 400),
            ),
          ),
          // Welcome text
          Positioned(
            bottom: 100,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                Text(
                  'SkillConnect',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopographicalPainter extends CustomPainter {
  const TopographicalPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.40)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final path = Path();
    
    // Create topographical lines
    for (var i = 0; i < 20; i++) {
      path.reset();
      path.moveTo(0, size.height * (i / 20));
      
      for (var x = 0.0; x < size.width; x += 20) {
        final y = size.height * (i / 20) + 
                 20 * sin(x / 50) * cos((x + i * 20) / 50);
        path.lineTo(x, y);
      }
      
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CurvedOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create curved overlay
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.3);
    
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.1,
      size.width,
      size.height * 0.3,
    );
    
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}