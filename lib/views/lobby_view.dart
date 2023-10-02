import 'package:flutter/material.dart';
import 'package:quiz_app/core/navigator_card.dart';
import 'package:quiz_app/core/standart_button.dart';
import 'package:quiz_app/product/edge_insets_items.dart';
import 'package:quiz_app/product/image_items.dart';
import 'package:quiz_app/views/starting_view.dart';

class LobbyView extends StatelessWidget {
  const LobbyView({super.key});
  static const String _title = "Quiz App";
  static const String _flagButton = "Country Flags Quiz";
  static const String _logoButton = "Football Team Logo Quiz";
  static const String _subtitle = "github.com/kadirkyr\n2023";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: Padding(
          padding: EdgeInsetsItems.horizontalStd,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: CardWithNavigator(
                  button: CoreButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => const StartingView(isLogo: false)));
                      },
                      buttonTitle: _flagButton),
                  imagePath: ImageItems.unknownFlag),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 4,
              child: CardWithNavigator(
                  button: CoreButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => const StartingView(isLogo: true)));
                      },
                      buttonTitle: _logoButton),
                  imagePath: ImageItems.unknownLogo),
            ),
            const Expanded(
              child: SizedBox(
                child: Center(
                    child: Text(_subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepOrange))),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
