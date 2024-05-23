import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTopCoursesModel {
  DashboardTopCoursesModel(this.title, this.heading, this.subHeading, this.onPressed,);

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPressed;

  static List<DashboardTopCoursesModel> list = [
    DashboardTopCoursesModel("Java Course", "5 Sections", "Programming Language", () { }),
    DashboardTopCoursesModel("C++ Course", "5 Sections", "Programming Language", ()  { }),
    DashboardTopCoursesModel("Python Course", "5 Sections", "Programming Language", ()  { }),
    DashboardTopCoursesModel("Flutter Course", "5 Sections", "Programming Language", ()  { }),
  ];

}

