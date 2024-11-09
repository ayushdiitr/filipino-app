import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width dynamically
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth, // Fill the entire screen width
      height: 232, // Fixed height
      child: Row(
        children: [
          // First Box with Dashed Border
          Expanded(
            child: DashedBox(
              height: 232,
              opacity: 1.0,  // Set opacity to 1 for visibility
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 10), // Space between the boxes
          // Second Box with Dashed Border
          Expanded(
            child: DashedBox(
              height: 232,
              opacity: 1.0,  // Set opacity to 1 for visibility
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedBox extends StatelessWidget {
  final double height;
  final double opacity;
  final BorderRadius borderRadius;

  DashedBox({
    required this.height,
    required this.opacity,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,  // Use the opacity value passed
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,  // No background
          borderRadius: borderRadius,
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  // Dash and space size
  final double dashWidth = 5.0;
  final double dashSpace = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xFF9B9B9B) // Dash color
      ..strokeWidth = 1.0 // Dash stroke width
      ..style = PaintingStyle.stroke;

    // Draw each border (top, left, right, bottom) with dashed lines
    _drawDashedLine(canvas, 0, 0, size.width, 0, paint);  // Top border
    _drawDashedLine(canvas, 0, 0, 0, size.height, paint); // Left border
    _drawDashedLine(canvas, size.width, 0, size.width, size.height, paint);  // Right border
    _drawDashedLine(canvas, 0, size.height, size.width, size.height, paint); // Bottom border
  }

  void _drawDashedLine(Canvas canvas, double startX, double startY, double endX, double endY, Paint paint) {
    double distance = (endX - startX).abs() + (endY - startY).abs();
    int dashCount = (distance / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      double dx = startX + (endX - startX) * i / dashCount;
      double dy = startY + (endY - startY) * i / dashCount;

      double nextDx = startX + (endX - startX) * (i + 1) / dashCount;
      double nextDy = startY + (endY - startY) * (i + 1) / dashCount;

      // Draw the dash if the current segment is even
      if ((i % 2 == 0)) {
        canvas.drawLine(Offset(dx, dy), Offset(nextDx, nextDy), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


