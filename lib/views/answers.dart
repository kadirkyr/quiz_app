import 'package:flutter/material.dart';
import 'package:quiz_app/core/standart_button.dart';
import 'package:quiz_app/product/edge_insets_items.dart';
import 'package:quiz_app/product/image_items.dart';
import 'package:quiz_app/product/teams/teams_items.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.isLogo});
  final bool isLogo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsetsItems.horizontalStd,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
              flex: 2,
              child: Container(
                  child: Image.asset(isLogo ? TeamItems().Teams.values.toList()[0] : ImageItems.unknownFlag,
                      width: 150, fit: BoxFit.fitWidth))),
          const Expanded(flex: 3, child: AnswersBox()),
          Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(TeamItems().Teams.keys.toList()[0]),
            CoreButton(onPressed: () {}, buttonTitle: "Done")
          ]))
        ]),
      ),
    );
  }
}

class AnswersBox extends StatefulWidget {
  const AnswersBox({
    super.key,
  });

  @override
  State<AnswersBox> createState() => _AnswersBoxState();
}

class _AnswersBoxState extends State<AnswersBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Card(
        color: Colors.white,
      ),
    );
  }
}
