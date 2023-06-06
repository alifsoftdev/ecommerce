import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class CustomLocalSearchBox extends StatelessWidget {
  final Function(String) searchFn;

  const CustomLocalSearchBox({super.key, required this.searchFn});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color:
          ConstantColors.lightGray, // red as border color
        ),
      ),
      child: ListTile(
        leading: const Icon(Icons.search),
        title: TextField(
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                hintText: 'I’m Looking for...',
                border: InputBorder.none),
            onChanged: searchFn,
            // onChanged: (value) => searchFn.filterProduct(value),
            ),
        trailing: const Icon(Icons.tune),
      ),
    );
  }
}
