import 'package:codegen/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          //color: Colors.blue.shade100,
          child: Lottie.network(
              'https://lottie.host/6332d830-1461-4306-b91c-d8e53b99fbb4/vyhW2w3xWz.json'),
        ),
        Text(
          fOnBoardingTitle3,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Text(
          fOnBoardingSubTitle3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Text(
          fOnBoardingCounter3,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
