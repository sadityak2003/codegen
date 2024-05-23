import 'package:codegen/constants/sizes.dart';
import 'package:codegen/screens/dashboard/course_screens/banner/webdev.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';
import '../../model/banner_model.dart';
import 'android.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Courses',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(fDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardBannersModel(title: fDashboardBannerTitle1, subTitle: fDashboardBannerSubTitle, onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AndroidCourse()));}),
                    const SizedBox(width: fDashboardCardPadding),

                    DashboardBannersModel(title: fDashboardBannerTitle2, subTitle: fDashboardBannerSubTitle, onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WebDevCourse()));}),
                  ],
                ),
                const SizedBox(height: fDashboardCardPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardBannersModel(title: fDashboardBannerTitle3, subTitle: fDashboardBannerSubTitle, onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AndroidCourse()));}),
                    const SizedBox(width: fDashboardCardPadding),

                    DashboardBannersModel(title: fDashboardBannerTitle4, subTitle: fDashboardBannerSubTitle, onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WebDevCourse()));}),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
