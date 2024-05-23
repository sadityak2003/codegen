import 'package:codegen/screens/onboarding/onBoard/onBoard1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

Future startOnBoardingScreen(context) async {
  await Future.delayed(const Duration(milliseconds: 5000));
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnBoardOne()));
}

  @override
  Widget build(BuildContext context) {
  final controller = startOnBoardingScreen(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(image: AssetImage(fSplashScreenIcon),
            width: 100, height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fAppName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    fAppTagLine,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Image(
              height: 500,
              width: 450,
              image: AssetImage(fSplashImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 80),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: fSplashContainerSize,
                  height: fSplashContainerSize,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
