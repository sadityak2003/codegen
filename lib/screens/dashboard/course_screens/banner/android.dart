import 'package:flutter/material.dart';

import '../../model/banner_model.dart';

class AndroidCourse extends StatelessWidget {
  const AndroidCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Android',
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
                child: DashboardBannersModel(title: 'Java', subTitle: '10 Lessons', onTap: () {})),
            Container(
                padding: const EdgeInsets.all(5),
                child: DashboardBannersModel(title: 'Kotlin', subTitle: '10 Lessons', onTap: () {})),
            Container(
                padding: const EdgeInsets.all(5),
                child: DashboardBannersModel(title: 'Flutter', subTitle: '10 Lessons', onTap: () {})),
            Container(
                padding: const EdgeInsets.all(5),
                child: DashboardBannersModel(title: 'React', subTitle: '10 Lessons', onTap: () {}))
          ],
        ),
      ),
    );
  }
}
