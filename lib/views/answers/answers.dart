import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/standart_button.dart';
import 'package:quiz_app/product/countries_items.dart';
import 'package:quiz_app/product/edge_insets_items.dart';
import 'package:quiz_app/product/teams_items.dart';
import 'package:quiz_app/views/answers/timer_widget.dart';

class Answers extends StatefulWidget {
  const Answers({super.key, required this.isLogo});
  final bool isLogo;

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  bool isRight = false;
  int secondsRemaining = 10;
  int correctCount = 0;
  int wrongCount = 0;
  final teams = TeamItems().teams;
  final countries = CountryItems().countries;
  int totalPoints = 0;
  late int currentIndex;
  late int randomInt1;
  late int randomInt2;
  late int randomInt3;
  final int teamsLength = TeamItems().teams.length;
  final int countriesLength = CountryItems().countries.length;

  @override
  void initState() {
    super.initState();
    changeAnswers();
  }

  void rightAnswer() {
    correctCount++;
    setState(() {
      changeAnswers();
      totalPoints += 20;
      isRight = true;
    });
  }

  void changeAnswers() {
    currentIndex = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
    randomInt1 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
    randomInt2 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
    randomInt3 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
    randomControl();
  }

  void falseAnswers() {
    wrongCount++;
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
      randomInt1 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
      randomInt2 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
      randomInt3 = Random().nextInt(widget.isLogo ? teamsLength : countriesLength);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TimerWidget(
            score: totalPoints,
            secondsRemaining: secondsRemaining,
            isRight: isRight,
            correctCount: correctCount,
            wrongCount: wrongCount,
          )),
      body: Padding(
        padding: EdgeInsetsItems.horizontalStd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsItems.horizontalStd2x,
                  child: Image.asset(widget.isLogo ? teams[currentIndex].getLogo : countries[currentIndex].getFlag,
                      fit: BoxFit.contain),
                )),
            const Divider(color: Colors.transparent),
            Expanded(flex: 2, child: answersBox(context)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total Points: ${totalPoints.toString()}", style: Theme.of(context).textTheme.labelMedium),
                  CoreButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      buttonTitle: "Done")
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
                  },
                  isReversedColor: true,
                  buttonTitle:
                      widget.isLogo ? teams[randomIndexes[index]].team : countries[randomIndexes[index]].country),
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
