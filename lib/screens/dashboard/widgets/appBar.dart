import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget{
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: const Text(fAppName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple.shade400,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 7, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: fCardBgColor,
          ),
          child: IconButton(
            onPressed: () {

            },
            icon: const Image(
              image: AssetImage(fUserProfileImage),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
