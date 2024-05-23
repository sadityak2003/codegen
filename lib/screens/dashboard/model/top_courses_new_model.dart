import 'package:codegen/screens/dashboard/course_screens/top_courses/cpp_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/flutter_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/java_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/python_course.dart';
import 'package:codegen/screens/dashboard/widgets/top_courses_new.dart';
import 'package:flutter/material.dart';


class DashboardTopCoursesNewModel extends StatelessWidget {
  const DashboardTopCoursesNewModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DashBoardTopCoursesNew(title: "Java Course", heading: "5 Sections", subHeading: "Programming Language",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "C++ Course", heading: "5 Sections", subHeading: "Programming Language",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CPPCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "Python Course", heading: "5 Sections", subHeading: "Programming Language",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PythonCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "Flutter Course", heading: "5 Sections", subHeading: "Programming Language",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterCourse()));}),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
