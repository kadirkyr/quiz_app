import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startCountdown();
  }

  String start = "Start";
  void startCountdown() {
    setState(() {
      start = "3";
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        start = "2";
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        start = "1";
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Placeholder(),
      ));
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        start = "Start";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        startCountdown();
      },
      splashColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        height: 100,
        child: Center(child: Text(start, style: Theme.of(context).textTheme.labelMedium)),
      ),
    );
  }
}
