import 'package:flutter/material.dart';
import 'package:quiz_app/core/standart_button.dart';
import 'package:quiz_app/product/image_items.dart';
import 'package:quiz_app/views/flag_quiz_view.dart';
import 'package:quiz_app/views/football_teams_quiz_view.dart';

class ChoosingView extends StatelessWidget {
  const ChoosingView({super.key});
  static const String _title = "Quiz App";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardWithNavigator(
              button: CoreButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlagQuizView()));
                  },
                  buttonTitle: "Country Flags Quiz"),
              imagePath: ImageItems.unknownFlag),
          const Divider(indent: 20, endIndent: 20, height: 0),
          CardWithNavigator(
              button: CoreButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FootballTeamsQuizView()));
                  },
                  buttonTitle: "Football Teams Logo Quiz"),
              imagePath: ImageItems.unknownLogo),
          const Text("github.com/kadirkyr\n2023", textAlign: TextAlign.center)
        ]),
      ),
    );
  }
}

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
            Image.asset(imagePath, height: 50, color: Colors.deepOrange),
            const Text("?", style: TextStyle(fontSize: 40))
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
