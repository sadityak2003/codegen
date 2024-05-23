import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../dashboard.dart';
import '../model/search.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.transparent,
          color: Colors.deepPurple.shade400,
          activeColor: Colors.deepPurple.shade400,
          tabBackgroundColor: Colors.deepPurple.shade50,
          padding: const EdgeInsets.all(5),
          gap: 8,
          tabs: [
            GButton(icon: Icons.home, text: 'Home', onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));
            }),
            GButton(icon: Icons.search, text: 'Search', onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Search()));
            }),
            const GButton(icon: Icons.developer_board, text: 'Dev'),
          ],
        ),
      ),
    );
  }
}

