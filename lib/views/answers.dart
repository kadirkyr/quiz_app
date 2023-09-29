import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/standart_button.dart';
import 'package:quiz_app/product/edge_insets_items.dart';
import 'package:quiz_app/product/image_items.dart';
import 'package:quiz_app/product/teams/teams_items.dart';

class Answers extends StatefulWidget {
  const Answers({super.key, required this.isLogo});
  final bool isLogo;

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  int totalPoints = 0;
  late int currentIndex;
  late int randomInt1;
  late int randomInt2;
  late int randomInt3;
  final int teamsLength = TeamItems().teams.length;

  void rightAnswer() {
    setState(() {
      changeAnswers();
      totalPoints += 20;
    });
  }

  void changeAnswers() {
    currentIndex = Random().nextInt(teamsLength);
    randomInt1 = Random().nextInt(teamsLength);
    randomInt2 = Random().nextInt(teamsLength);
    randomInt3 = Random().nextInt(teamsLength);
    randomControl();
  }

  void falseAnswers() {
    setState(() {
      changeAnswers();
      totalPoints -= 10;
    });
  }

  void randomControl() {
    while (randomInt1 == currentIndex ||
        randomInt2 == currentIndex ||
        randomInt3 == currentIndex ||
        randomInt1 == randomInt2 ||
        randomInt1 == randomInt3 ||
        randomInt2 == randomInt3) {
      randomInt1 = Random().nextInt(teamsLength);
      randomInt2 = Random().nextInt(teamsLength);
      randomInt3 = Random().nextInt(teamsLength);
    }
  }

  @override
  void initState() {
    super.initState();
    changeAnswers();
    randomControl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsetsItems.horizontalStd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  widget.isLogo ? TeamItems().teams[currentIndex].getLogo : ImageItems.unknownFlag,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Expanded(
              flex: 2,
              child: answersBox(context),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(totalPoints.toString()),
                  CoreButton(onPressed: () {}, buttonTitle: "Done"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox answersBox(BuildContext context) {
    // Rastgele indeksleri seç
    final List<int> randomIndexes = [currentIndex, randomInt1, randomInt2, randomInt3];
    randomIndexes.shuffle();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => CoreButton(
                onPressed: () {
                  indexControl(randomIndexes, index);
                  print(index);
                },
                isReversedColor: true,
                buttonTitle: TeamItems().teams[randomIndexes[index]].team,
              ),
            )),
      ),
    );
  }

  void indexControl(List list, int index) {
    if (list[index] == currentIndex) {
      rightAnswer();
    } else {
      falseAnswers();
    }
  }
}
