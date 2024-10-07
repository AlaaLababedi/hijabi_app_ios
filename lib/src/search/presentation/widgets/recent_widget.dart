import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentWidget extends StatelessWidget {
  RecentWidget({super.key});
  final List<String> recentSearches = ['TMA2 Wireless', 'Cable', 'Macbook'];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Recent Search',
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 180.h,
        child: ListView.builder(
          itemCount: recentSearches.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(recentSearches[index]),
              trailing:
                  IconButton(icon: const Icon(Icons.close), onPressed: () {}),
              leading: const Icon(Icons.history),
            );
          },
        ),
      )
    ]);
  }
}
