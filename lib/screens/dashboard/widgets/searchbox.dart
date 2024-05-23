import 'package:codegen/screens/dashboard/model/search.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Search()));
      },
      child: Container(
        padding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(width: 4, color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fDashboardSearch,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Search()));
            }, icon: const Icon(Icons.mic))
          ],
        ),
      ),
    );
  }
}

