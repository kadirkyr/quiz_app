import 'package:flutter/material.dart';
import 'package:quiz_app/core/start_button.dart';

class FootballTeamsQuizView extends StatefulWidget {
  const FootballTeamsQuizView({super.key});

  @override
  State<FootballTeamsQuizView> createState() => _FootballTeamsQuizViewState();
}

class _FootballTeamsQuizViewState extends State<FootballTeamsQuizView> {
  static const String _title = "Football Team Logos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [StartButton()]),
    );
  }
}
