import 'package:codegen/cmmon_widgets/custom_container.dart';
import 'package:codegen/screens/dashboard/dev_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard.dart';
import '../model/search.dart';
import 'drawerHeader.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 250,
      //elevation: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const MyDrawerHeader(),
            const SizedBox(height: 10),
            DrawerTiles(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));},
                text: "Dashboard",
                icon: FontAwesomeIcons.dashcube),
            DrawerTiles(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Search()));},
                text: "Search Courses",
                icon: FontAwesomeIcons.searchengin),
            DrawerTiles(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DevInfo()));},
                text: "Dev-Info",
                icon: FontAwesomeIcons.dev),
            const SizedBox(height: 350),

            // Sign Out Button
            isLoading? const CircularProgressIndicator()
                : CustomContainer(onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  FirebaseAuth.instance.signOut();
                  setState(() {
                    isLoading = false;
                  });
            }, color: Colors.red, width: 150, height: 50, text: "Sign-Out", icon: FontAwesomeIcons.signOut)
          ],
        ),
      ),
    );
  }
}

class DrawerTiles extends StatelessWidget {
  const DrawerTiles({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
  });

  final VoidCallback onTap;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(text,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
