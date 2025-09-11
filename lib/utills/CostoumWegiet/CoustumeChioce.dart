import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';

class ChooseAndWrite extends StatelessWidget {
  final String question;
  final bool value;
  final Function(bool) onChanged;

  const ChooseAndWrite({
    super.key,
    required this.question,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            question,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          children: [
            Text('No', style: Theme.of(context).textTheme.bodySmall),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: App_Colors.generalColor,
            ),
            Text('Yes', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}