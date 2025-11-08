import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  final Color primaryColor;
  final int duration;
  final VoidCallback onTimerFinish;

  const CountdownTimer({
    Key? key,
    required this.primaryColor,
    this.duration = 59,
    required this.onTimerFinish,
  }) : super(key: key);

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remaining;
  Timer? _timer;
  bool _isFinished = false;

  bool get isFinished => _isFinished;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isFinished = false;
    _remaining = widget.duration;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining > 0) {
        setState(() {
          _remaining--;
        });
      } else {
        _timer?.cancel();
        _isFinished = true;
        widget.onTimerFinish();
      }
    });
  }

  void restartTimer() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String secondsText = _remaining.toString().padLeft(2, '0');
    return Text(
      '00:$secondsText Seconds Remaining',
      style: TextStyle(
        color: widget.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
