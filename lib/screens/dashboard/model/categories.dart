import 'package:codegen/screens/dashboard/course_screens/categories/java_script.dart';
import 'package:flutter/material.dart';

class DashboardCategoriesModel {
  DashboardCategoriesModel(
    this.title,
    this.heading,
    this.subHeading,
    this.onPress,
);

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("JS", "Java Script", "10 Lessons", () {}),
    DashboardCategoriesModel("A", "Angular", "10 Lessons", () {}),
    DashboardCategoriesModel("R", "Rust", "10 Lessons", () {}),
    DashboardCategoriesModel("S", "Scala", "10 Lessons", () {}),
  ];

}

