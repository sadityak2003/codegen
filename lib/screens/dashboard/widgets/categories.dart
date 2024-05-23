import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../model/categories.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;

    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
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
                      list[index].title,
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
                        list[index].heading,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
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
      ),
    );
  }
}
