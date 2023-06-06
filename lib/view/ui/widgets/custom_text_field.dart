import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/strings.dart';

class CustomTextField extends StatelessWidget {
  final String hintTxt;
  String? initialValue;
  TextInputType inputType;
  double? w;
  double? h;
  Color? borderClr;
  bool? obsecureFlag;
  int? numOfLines;
  TextEditingController? textEditingController;

  String? Function(String?)? validator;
  String? imagePath;
  String? suffixIcon;

  CustomTextField({
    Key? key,
    required this.hintTxt,
    required this.inputType,
    this.w,
    this.h,
    this.borderClr,
    this.obsecureFlag,
    this.numOfLines,
    this.textEditingController,
    this.validator,
    this.initialValue,
    this.imagePath,
    this.suffixIcon,
  }) : super(key: key);
  List<bool> toggleList = <bool>[];

  void _toggle(int index) {
    //   setState(() {
    toggleList[index] = !toggleList[index];
    // _isToggle = !_isToggle;
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w ?? 336.w,
      height: h ?? 50.h,
      child: TextFormField(
        maxLines: numOfLines ?? 1,
        keyboardType: inputType,
        obscureText: obsecureFlag ?? false,
        controller: textEditingController,
        style: TextStyle(
            fontSize: 14.sp,
            fontFamily: ConstantStrings.kAppFont,
            color: HexColor('#656E72')),
        decoration: InputDecoration(
            hintText: hintTxt,
            prefixIcon: Image.asset(imagePath!),
            suffixIcon: Image.asset(suffixIcon!),
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: ConstantStrings.kAppFont,
                color: HexColor('#656E72')),
            focusedBorder: borderDesign(),
            enabledBorder: borderDesign(),
            contentPadding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0)),
        onChanged: (value) {},
        autocorrect: false,
        validator: validator,
      ),
    );
  }

  OutlineInputBorder borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderClr ?? Colors.grey.shade300),
    );
  }
}
