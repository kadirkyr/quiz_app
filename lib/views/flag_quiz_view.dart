import 'package:flutter/material.dart';
import 'package:quiz_app/core/start_button.dart';

class FlagQuizView extends StatefulWidget {
  const FlagQuizView({super.key});

  @override
  State<FlagQuizView> createState() => _FlagQuizViewState();
}

class _FlagQuizViewState extends State<FlagQuizView> {
  static const String _title = "Country Flags";
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
