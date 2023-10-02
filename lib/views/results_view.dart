import 'package:flutter/material.dart';
import 'package:quiz_app/views/lobby_view.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({
    super.key,
    required this.correctCount,
    required this.wrong,
    required this.score,
  });
  static const String _title = "Results";
  final int correctCount;
  final int wrong;
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.refresh_rounded, color: Colors.deepOrange)),
            FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LobbyView(),
                  ));
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.home_rounded, color: Colors.deepOrange))
          ]),
        ),
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(_title),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResultsInfoCard(title: 'score', subtitle: score.toString()),
                  ResultsInfoCard(title: 'correct', subtitle: correctCount.toString()),
                  ResultsInfoCard(title: 'wrong', subtitle: wrong.toString()),
                ],
              ),
            ),
            const Spacer(),
          ],
        ));
  }
}

class ResultsInfoCard extends StatelessWidget {
  const ResultsInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 35, color: Colors.deepOrange)),
            const Divider(color: Colors.deepOrange, thickness: 2, endIndent: 20, indent: 20, height: 25),
            Text(subtitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.deepOrange, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
