import 'package:flutter/material.dart';
import 'package:test_task/theme.dart';

class Progress extends StatelessWidget {
  Progress({super.key, required this.currentNum});

  final int currentNum;
  late final List<Widget> listPoint = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 3; ++i) {
      listPoint.add(
        i < currentNum
            ? NumberCircle(
                number: i + 1,
                isCurrent: false,
                pastPoint: true,
              )
            : i == currentNum
                ? NumberCircle(
                    number: i + 1,
                    isCurrent: true,
                    pastPoint: false,
                  )
                : NumberCircle(
                    number: i + 1,
                    isCurrent: false,
                    pastPoint: false,
                  ),
      );
    }
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: CustomPaint(
            painter: HorizontalLinePainter(),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              2,
              (index) {
                return Icon(
                  Icons.check,
                  color: index + 1 > currentNum
                      ? Colors.transparent
                      : LightColors.grey,
                );
              },
              // children: [Icon(Icons.check), Icon(Icons.check)],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listPoint,
        )
      ],
    );
  }
}

class NumberCircle extends StatelessWidget {
  final bool isCurrent;
  final int number;
  final bool pastPoint;

  const NumberCircle({
    super.key,
    required this.number,
    required this.isCurrent,
    required this.pastPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent
            ? LightColors.yellow
            : pastPoint
                ? Colors.white
                : LightColors.grey,
        border: Border.all(
          color: pastPoint ? Colors.green : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(),
        ),
      ),
    );
  }
}

class HorizontalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = LightColors.grey
      ..strokeWidth = 2.0;

    final startY = size.height / 2;
    final endY = size.height / 2;

    final startPoint = Offset(0, startY);
    final endPoint = Offset(size.width, endY);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
