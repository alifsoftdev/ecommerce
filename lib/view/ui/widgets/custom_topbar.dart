import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_dropdown.dart';

class CustomTopBar extends StatefulWidget {
  const CustomTopBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  void initState() {
    super.initState();
  }

  /* final List<String> _currencyList = [
    'USD',
    'AED',
  ];*/

  final List<String> _languageList = [
    'English',
    'Bangla',
    'Hindi',
  ];

  String _initLan = 'English';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /*   const Text(
            'Store Location',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 8),
            child: VerticalDivider(
              color: Colors.black,
            ),
          ),*/
          const Text(
            'Track Order',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 8),
            child: VerticalDivider(
              color: Colors.black,
            ),
          ),
/*          SizedBox(
            width: 100.w,
            height: 34.h,
            child: CustomDropDown(
              initialValue: _initCurrency,
              itemList: _currencyList,
              onChangedFn: (value) => setState(() => _initCurrency = value),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 8),
            child: VerticalDivider(
              color: Colors.black,
            ),
          ),*/
          SizedBox(
            width: 100.w,
            height: 34.h,
            child: CustomDropDown(
              initialValue: _initLan,
              itemList: _languageList,
              onChangedFn: (value) => setState(() => _initLan = value),
            ),
          ),
        ],
      ),
    );
  }
}
