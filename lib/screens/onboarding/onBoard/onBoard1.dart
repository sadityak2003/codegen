import 'package:codegen/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro-Screens/intro-page1.dart';
import '../intro-Screens/intro-page2.dart';
import '../intro-Screens/intro-page3.dart';
import '../widgets/start_screen.dart';

class OnBoardOne extends StatefulWidget {
  const OnBoardOne({super.key});

  @override
  State<OnBoardOne> createState() => _OnBoardOneState();
}

class _OnBoardOneState extends State<OnBoardOne> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: const Text(
                          '          ',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text(
                          'Skip>>',
                          style: TextStyle(
                            color: Colors.deepPurple.shade400,
                          ),
                        ),
                      ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.deepPurple.shade400,
                    dotColor: Colors.deepPurple.shade400,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 6,
                  ),
                ),

                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const WelcomeScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.deepPurple.shade400,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Next>',
                          style: TextStyle(
                            color: Colors.deepPurple.shade400,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
