import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codegen/screens/dashboard/course_screens/banner/banner_screen.dart';
import 'package:codegen/screens/dashboard/model/categories_new_model.dart';
import 'package:codegen/screens/dashboard/model/search.dart';
import 'package:codegen/screens/dashboard/model/top_courses_new_model.dart';
import 'package:codegen/screens/dashboard/widgets/appBar.dart';
import 'package:codegen/screens/dashboard/widgets/banner.dart';
import 'package:codegen/screens/dashboard/widgets/bottomNavBar.dart';
import 'package:codegen/screens/dashboard/widgets/drawer.dart';
import 'package:codegen/screens/dashboard/widgets/drawerHeader.dart';
import 'package:codegen/screens/dashboard/widgets/searchbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists && userDoc.data() != null) {
          setState(() {
            name = userDoc.get('name');
          });
        } else {
          setState(() {
            name = "...";
          });
        }
      } else {
        setState(() {
          name = "...";
        });
      }
    } catch (e) {
      setState(() {
        name = "...";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const DashboardAppbar(),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(fDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey, "+name, style: Theme.of(context).textTheme.bodyMedium),
              Text(fDashboardHeading, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: fDashboardPadding),

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
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BannerScreen()));},
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