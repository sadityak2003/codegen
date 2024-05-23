import 'package:codegen/screens/dashboard/model/banner_model.dart';
import 'package:flutter/material.dart';

class WebDevCourse extends StatelessWidget {
  const WebDevCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Web Development',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GridView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  child: DashboardBannersModel(title: 'HTML', subTitle: '10 Lessons', onTap: () {})),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: DashboardBannersModel(title: 'CSS', subTitle: '10 Lessons', onTap: () {})),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: DashboardBannersModel(title: 'Java Script', subTitle: '10 Lessons', onTap: () {}))
            ],
          ),
        ),
    );
  }
}
