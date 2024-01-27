import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_task/features/login/widgets/pinput.dart';
import 'package:test_task/theme.dart';

class TextPin extends StatefulWidget {
  const TextPin({super.key});

  @override
  State<TextPin> createState() => _TextPinState();
}

class _TextPinState extends State<TextPin> {
  late Timer _timer;
  late int _remainingSeconds;
  @override
  void initState() {
    _remainingSeconds = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        --_remainingSeconds;
        if (_remainingSeconds == 0) {
          _timer.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PinputCustom(),
        Text(
          _remainingSeconds == 0
              ? 'Отправить код еще раз'
              : '$_remainingSeconds сек до повторной отправки кода',
          style: lightTheme.textTheme.displaySmall!.copyWith(
            color: _remainingSeconds == 0
                ? LightColors.yellow
                : LightColors.textMain,
          ),
        ),
      ],
    );
  }
}
