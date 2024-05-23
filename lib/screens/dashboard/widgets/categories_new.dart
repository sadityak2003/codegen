import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../model/categories.dart';

class DashboardCategoriesNew extends StatelessWidget {
  const DashboardCategoriesNew({
    super.key, required this.title, required this.heading, required this.subHeading, this.onPress,
  });

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;

    return SizedBox(
      height: 70,
      child: GestureDetector(
          onTap: onPress,
          child: SizedBox(
            height: 70,
            width: 250,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fDarkColor),
                  child: Center(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heading,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subHeading,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
