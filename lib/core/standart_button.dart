import 'package:flutter/material.dart';
import 'package:quiz_app/product/edge_insets_items.dart';

class CoreButton extends StatelessWidget {
  const CoreButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
  });
  final void Function()? onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsetsItems.horizontalStd,
        child: ElevatedButton(onPressed: onPressed, child: Text(buttonTitle)),
      ),
    );
  }
}
