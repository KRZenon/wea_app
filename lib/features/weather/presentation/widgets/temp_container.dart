import 'package:flutter/material.dart';
import 'package:wa/core/const/constants.dart';

class TempContainer extends StatelessWidget {
  final String temp;
  final String label;
  final bool isCurrent;
  const TempContainer({
    super.key,
    required this.label,
    required this.temp,
     this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: isCurrent ? tempBorderColor : tempBorderColor.withOpacity(0.15)
        ),
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(temp, textScaler: TextScaler.linear(
                      isCurrent ? 1 : 0.4),
                    style: Theme.of(context)
                        .textTheme.displayMedium!
                        .copyWith(color: isCurrent ? Colors.white : Colors.white70,
                        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal),
                  ),
                ],
              ),
              Text("°", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: isCurrent ? Colors.white : Colors.white70,),),
              Text("C", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: isCurrent ? Colors.white : Colors.white70, fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal),),
            ],
          ),
          Text(label, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: isCurrent ? Colors.white : Colors.white70),),
        ],
      ),
    );
  }
}
