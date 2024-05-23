import 'package:codegen/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          //color: Colors.pinkAccent.shade100,
          child: Lottie.network(
              'https://lottie.host/df5a4b1c-42fd-46fb-a372-d38c6a346e0c/IbaV4kkUBZ.json'),
        ),
        Text(
          fOnBoardingTitle1,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Text(
          fOnBoardingSubTitle1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Text(
          fOnBoardingCounter1,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
