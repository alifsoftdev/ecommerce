import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/helper.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final Function(bool?) onChangedFn;
  final String title;
  int? numOfLine;
  CustomCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChangedFn,
    required this.title,
    this.numOfLine,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checkboxFlag = false;

  @override
  void initState() {
    super.initState();
    _checkboxFlag = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Checkbox(
            value: _checkboxFlag,
            splashRadius: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
              color: Colors.grey.shade300,
            ),
            activeColor: Colors.amber.shade900,
            onChanged: (value) => setState(
              () {
                _checkboxFlag = value!;
                widget.onChangedFn(value);
              },
            ),
          ),
        ),
        addW(10.w),
        Flexible(
          flex: 18,
          child: Text(
            widget.title,
            maxLines: widget.numOfLine,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
