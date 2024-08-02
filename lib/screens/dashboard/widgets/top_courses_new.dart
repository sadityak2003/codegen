import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';

class DashBoardTopCoursesNew extends StatelessWidget {
  const DashBoardTopCoursesNew({
    super.key,
    required this.title,
    required this.heading,
    required this.subHeading,
    this.onPressed,
    required this.lottie,
  });

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPressed;
  final String lottie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SizedBox(
        width: 320,
        height: 210,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: fCardBgColor),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                     Flexible(
                        child: Container(
                          width: 150,
                          height: 120,
                          child: Lottie.network(lottie),
                        )
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      onPressed: onPressed,
                      child: const Icon(Icons.play_arrow),
                    ),
                    const SizedBox(
                      width: fDashboardCardPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subHeading,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
