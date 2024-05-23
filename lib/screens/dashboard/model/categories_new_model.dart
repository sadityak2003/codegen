import 'package:codegen/screens/dashboard/course_screens/categories/angular.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/java_script.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/rust.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/scala.dart';
import 'package:codegen/screens/dashboard/widgets/categories_new.dart';
import 'package:flutter/material.dart';

class DashboardCategoriesNewModel extends StatelessWidget {
  const DashboardCategoriesNewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DashboardCategoriesNew(title: "JS", heading: "Java Script", subHeading: "10 Lessons",
            onPress: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaScriptCourse()));}),

          DashboardCategoriesNew(title: "A", heading: "Angular", subHeading: "10 Lessons",
            onPress: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AngularCourse()));}),

          DashboardCategoriesNew(title: "R", heading: "Rust", subHeading: "10 Lessons",
            onPress: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RustCourse()));}),

          DashboardCategoriesNew(title: "S", heading: "Scala", subHeading: "10 Lessons",
            onPress: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScalaCourse()));}),

        ],
      ),
    );
  }
}
