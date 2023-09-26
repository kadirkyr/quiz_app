import 'package:flutter/material.dart';
import 'package:quiz_app/core/standart_button.dart';

class CardWithNavigator extends StatelessWidget {
  const CardWithNavigator({
    super.key,
    required this.button,
    required this.imagePath,
  });
  final CoreButton button;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Stack(alignment: Alignment.center, children: [
            Image.asset(imagePath, height: 50, color: Colors.white),
            const Text("?", style: TextStyle(fontSize: 40, color: Colors.deepOrange))
          ]),
          Text(
            "Guess which country the flag on the screen belongs to and earn points!",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          button,
        ]),
      ),
    );
  }
}
