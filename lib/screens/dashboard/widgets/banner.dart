import 'package:codegen/screens/dashboard/course_screens/banner/android.dart';
import 'package:codegen/screens/dashboard/course_screens/banner/webdev.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../model/banner_model.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardBannersModel(title: fDashboardBannerTitle1, subTitle: fDashboardBannerSubTitle, onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AndroidCourse()));
            },),
            const SizedBox(width: fDashboardCardPadding),

            DashboardBannersModel(title: fDashboardBannerTitle2, subTitle: fDashboardBannerSubTitle, onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WebDevCourse()));
            },),
          ],
       );
  }
}

