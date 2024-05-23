import 'package:codegen/constants/colors.dart';
import 'package:codegen/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? fSecondaryColor : fPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(fDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'welcome-image-tage',
                    child: Image(
                      image: const AssetImage(fWelcomeScreenImages),
                      height: height * 0.6,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        fWelcomeTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        fWelcomeSubTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));
                          },
                          child: Text(fLogin.toUpperCase()),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));
                          },
                          child: Text(fSignUp.toUpperCase()),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
