import 'package:flutter/material.dart';
import 'package:wa/core/const/constants.dart';

class ErrorContainer extends StatelessWidget {
  final String error;
  const ErrorContainer({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 250), child: Image.asset("assets/img/warning.png"),),
        const SizedBox(height: defaultPadding),
        Text(error),
      ],
    );
  }
}
