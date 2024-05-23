import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../model/top_courses.dart';

class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = DashboardTopCoursesModel.list;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPressed,
          child: SizedBox(
            width: 320,
            height: 210,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: fCardBgColor),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          list[index].title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                        const Flexible(
                            child: Image(
                          image: AssetImage(fTopCourseImage1),
                          height: 110,
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          onPressed: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                          },
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(
                          width: fDashboardCardPadding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].heading,
                              style: Theme.of(context).textTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              list[index].subHeading,
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
