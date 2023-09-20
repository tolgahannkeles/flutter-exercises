import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget {
  const CustomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Padding(
            padding: _PaddingUtility.horizontalPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(text: "Order a Pizza", onPressed: () {}),
            ),
          ),
        ),
        CustomFoodButton(text: "sa", onPressed: () {}),
      ]),
    );
  }
}

class CustomFoodButton extends StatelessWidget {
  const CustomFoodButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: _ColorsUtility.primaryButton,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: _PaddingUtility.verticalPadding,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _ColorsUtility.primaryButtonText,
              ),
        ),
      ),
    );
  }
}

class _PaddingUtility {
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 10);
}

class _ColorsUtility {
  static const Color primaryButton = Colors.red;
  static const Color primaryButtonText = Colors.white;
}
