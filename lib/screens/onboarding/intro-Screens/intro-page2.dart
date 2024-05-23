import 'package:codegen/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          //color: Colors.orange.shade100,
          child: Lottie.network('https://lottie.host/269ee8fe-aec1-46f7-a549-1c914117dbaf/qXhdZpFkBP.json'),
        ),
        Text(
          fOnBoardingTitle2,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Text(
          fOnBoardingSubTitle2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Text(
          fOnBoardingCounter2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
