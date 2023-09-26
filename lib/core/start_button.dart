import 'package:flutter/material.dart';
import 'package:quiz_app/product/size_items.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key, required this.page});
  final Widget page;
  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  static const String _start = "Start";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.page));
      },
      splashColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepOrange),
        height: ProjectSizes.startButtonSize,
        child: Center(
            child: Text(_start,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: ProjectSizes.fontSize2x))),
      ),
    );
  }
}
