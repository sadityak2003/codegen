import 'package:codegen/screens/dashboard/course_screens/banner/banner_screen.dart';
import 'package:codegen/screens/dashboard/model/categories_new_model.dart';
import 'package:codegen/screens/dashboard/model/top_courses_new_model.dart';
import 'package:codegen/screens/dashboard/widgets/appBar.dart';
import 'package:codegen/screens/dashboard/widgets/banner.dart';
import 'package:codegen/screens/dashboard/widgets/bottomNavBar.dart';
import 'package:codegen/screens/dashboard/widgets/searchbox.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppbar(),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(fDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fDashboardTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                fDashboardHeading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: fDashboardPadding,
              ),

              // Search Box
              const DashboardSearchBox(),
              const SizedBox(height: fDashboardCardPadding),

              // Categories
              const DashboardCategoriesNewModel(),
              const SizedBox(height: fDashboardCardPadding),

              // Banner
              const DashboardBanners(),
              const SizedBox(height: fDashboardCardPadding),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BannerScreen()));},
                  child: const Text('View All'),
                ),
              ),
              const SizedBox(height: fDashboardCardPadding),

              // Top Courses
              Text(fDashboardTopCourses, style: Theme.of(context).textTheme.headlineSmall!.apply(fontSizeFactor: 1.0),),
              const DashboardTopCoursesNewModel(),
            ],
          ),
        ),
      ),
    );
  }
}

