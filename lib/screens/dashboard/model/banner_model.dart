import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';

class DashboardBannersModel extends StatelessWidget {
  const DashboardBannersModel({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: fCardBgColor),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Image(
                        image: AssetImage(fWelcomeScreenImages),
                      )),
                  Flexible(
                      child: Image(
                        image: AssetImage(fBannerImage1),
                      )),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
