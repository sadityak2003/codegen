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
          DashBoardTopCoursesNew(title: "Java Course", heading: "5 Sections", subHeading: "Programming Language", lottie: "https://lottie.host/dd9c5295-4444-4f3e-8f6b-7f9d5979da5e/fwYzXByRZz.json",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "C++ Course", heading: "5 Sections", subHeading: "Programming Language", lottie: "https://lottie.host/c7939065-b291-4768-bdda-8b4001d491c8/ka2gucB71g.json",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CPPCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "Python Course", heading: "5 Sections", subHeading: "Programming Language", lottie: "https://lottie.host/4b621b62-8d7f-491b-bfa9-cfc623cfab6d/VT15EnpfV3.json",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PythonCourse()));}),
          const SizedBox(width: 5),

          DashBoardTopCoursesNew(title: "Flutter Course", heading: "5 Sections", subHeading: "Programming Language", lottie: "https://lottie.host/57bb0f97-1123-45af-a6b9-5f3ac3b7d5af/NhrDUZmKJU.json",
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterCourse()));}),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
