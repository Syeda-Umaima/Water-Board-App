import 'package:flutter/material.dart';
import 'dart:async';

// Custom widget for a simple countdown timer.
class CountdownTimer extends StatefulWidget {
  final Color primaryColor;
  // Renamed 'seconds' to 'duration' to match usage in otp_verify.dart
  final int duration; 
  // Renamed 'onTimerFinished' to 'onTimerFinish' to match usage in otp_verify.dart
  final VoidCallback onTimerFinish; 

  const CountdownTimer({
    Key? key,
    required this.primaryColor,
    this.duration = 59, // Use 'duration' here
    required this.onTimerFinish, // Use 'onTimerFinish' here
  }) : super(key: key);

  @override
  // Renamed the State class to be public
  CountdownTimerState createState() => CountdownTimerState();
}

// State class is now public (removed the underscore) to be used in GlobalKey
class CountdownTimerState extends State<CountdownTimer> {
  late int _remaining;
  Timer? _timer;
  bool _isFinished = false; // Internal state to track if the timer is done

  // Public getter for external access (used by otp_verify.dart)
  bool get isFinished => _isFinished;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Reset finished status
    _isFinished = false;
    _remaining = widget.duration; // Use widget.duration
    
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining > 0) {
        setState(() {
          _remaining--;
        });
      } else {
        _timer?.cancel();
        _isFinished = true; // Set status when timer is done
        widget.onTimerFinish(); // Use widget.onTimerFinish
      }
    });
  }
  
  // Expose a method to restart the timer externally
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
    // Format the remaining seconds with leading zero if less than 10
    String secondsText = _remaining.toString().padLeft(2, '0');
    
    return Text(
      '00:$secondsText Seconds Remaining',
      style: TextStyle(
        color: widget.primaryColor, 
        fontSize: 14, 
        fontWeight: FontWeight.w500
      ),
    );
  }
}
