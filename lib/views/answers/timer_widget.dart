import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/views/results_view.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.secondsRemaining,
    required this.isRight,
    required this.correctCount,
    required this.wrongCount,
    required this.score,
  });
  final int secondsRemaining;
  final bool isRight;
  final int correctCount;
  final int wrongCount;
  final int score;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int _secondsRemaining;
  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.secondsRemaining;
    startTimer();
  }

  @override
  void didUpdateWidget(covariant TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isRight) {
      _secondsRemaining += 1;
    }
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        // Sayaç tamamlandığında başka bir sayfaya yönlendirme yapabilirsiniz.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultsView(wrong: widget.wrongCount, correctCount: widget.correctCount, score: widget.score)),
        );
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_secondsRemaining != 0 ? "Last $_secondsRemaining seconds" : "Time's up",
        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 25));
  }
}
