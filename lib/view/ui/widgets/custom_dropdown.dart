import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final String initialValue;
  final Function(String) onChangedFn;
  final List<String> itemList;
  const CustomDropDown({
    Key? key,
    required this.initialValue,
    required this.itemList,
    required this.onChangedFn,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String _selectedPetType = 'Usd';

  @override
  void initState() {
    _selectedPetType = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.grey.shade300,
      //   ),
      // ),
      child: DropdownButton(
        value: _selectedPetType,
        elevation: 0,
        underline: const SizedBox(),
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.sp,
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 20,
        isExpanded: true,
        items: widget.itemList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          widget.onChangedFn(newValue!);
          setState(() => _selectedPetType = newValue);
        },
      ),
    );
  }
}
