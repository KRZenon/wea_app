import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa/core/const/constants.dart';

class WeatherAttribute extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const WeatherAttribute({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FaIcon(icon, size: Theme.of(context).textTheme.headlineLarge!.fontSize),
        const SizedBox(width: defaultPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        )
      ],
    );
  }
}
