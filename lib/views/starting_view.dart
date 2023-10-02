import 'package:flutter/material.dart';
import 'package:quiz_app/core/start_button.dart';
import 'package:quiz_app/product/edge_insets_items.dart';
import 'package:quiz_app/views/answers/answers.dart';

class StartingView extends StatelessWidget {
  const StartingView({super.key, required this.isLogo});
  final bool isLogo;
  static const String _logoTitle = "Football Team Logo";
  static const String _countryTitle = "Country Flag";

  String checkString() {
    if (isLogo) {
      return "If you know who the $_logoTitle belongs to, you will earn 20 points. If you answer incorrectly you will lose 10 points.";
    }
    return "If you know who the $_countryTitle belongs to, you will earn 20 points. If you answer incorrectly you will lose 10 points.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogo ? _logoTitle : _countryTitle),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: EdgeInsetsItems.horizontalStd,
          child: Text(checkString(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.deepOrange),
              textAlign: TextAlign.center),
        ),
        StartButton(
          page: Answers(isLogo: isLogo),
        )
      ]),
    );
  }
}
