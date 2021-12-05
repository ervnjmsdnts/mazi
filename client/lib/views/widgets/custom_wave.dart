import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mazi/const/app_colors.dart';

class WaterRipple extends StatefulWidget {
  final int count;
  final Color color;

  const WaterRipple(
      {Key? key, this.count = 4, this.color = const Color(AppColors.bluey)})
      : super(key: key);

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    super.initState();
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
          painter: WaterRipplePainter(
            _controller.value,
            count: widget.count,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final int count;
  final Color color;

  final Paint _paint = Paint()
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke;

  WaterRipplePainter(this.progress,
      {this.count = 3, this.color = const Color(AppColors.purply)});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);

    for (int i = count; i >= 0; i--) {
      final double opacity = (1.0 - ((i + progress) / (count + 1)));
      final Color _color = color.withOpacity(opacity);
      _paint.color = _color;

      double _radius = radius * ((i + progress) / (count + 1));

      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), _radius, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
