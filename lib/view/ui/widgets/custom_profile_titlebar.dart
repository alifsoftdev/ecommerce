import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/strings.dart';

class CustomProfileTitleBar extends StatefulWidget {
  final void Function(bool) getFlagFn;
  final VoidCallback onTapFn;
  final String title;
  // String? editIcon;

  const CustomProfileTitleBar({
    Key? key,
    required this.getFlagFn,
    required this.onTapFn,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomProfileTitleBar> createState() => _CustomProfileTitleBarState();
}

class _CustomProfileTitleBarState extends State<CustomProfileTitleBar> {
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SizedBox(
            child: InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          'assets/images/back.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        //apply padding to all four sides
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: ConstantStrings.kAppFont),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _isEditing = !_isEditing;
                      widget.getFlagFn(_isEditing);
                      if (!_isEditing) {
                        widget.onTapFn();
                      }
                    }),
                    child: _isEditing
                        ? const Icon(
                            Icons.check,
                            size: 30,
                            color: Colors.black,
                          )
                        : Image.asset(
                            'assets/images/edit.png',
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
