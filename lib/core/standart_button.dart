import 'package:flutter/material.dart';
import 'package:quiz_app/product/edge_insets_items.dart';

class CoreButton extends StatelessWidget {
  const CoreButton({super.key, required this.onPressed, required this.buttonTitle, this.isReversedColor = false});
  final void Function()? onPressed;
  final String buttonTitle;
  final bool isReversedColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsetsItems.horizontalStd2x,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: isReversedColor ? Colors.deepOrange : null,
              foregroundColor: isReversedColor ? Colors.white : null,
            ),
            child: Text(buttonTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
