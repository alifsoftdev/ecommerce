import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/strings.dart';

class TextFieldContainer extends StatelessWidget {
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

  TextFieldContainer({
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
  }) : super(key: key);
  List<bool> toggleList = <bool>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w ?? 336.w,
      height: h ?? 80.h,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
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
            errorBorder: InputBorder.none,
            hintText: hintTxt,
            prefixIcon: Image.asset(imagePath!),
            hintStyle: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#656E72'),
                fontFamily: ConstantStrings.kAppFont),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
          ),
          onChanged: (value) {},
          autocorrect: false,
          validator: validator,
        ),
      ),
    );
  }

  OutlineInputBorder borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderClr ?? Colors.grey.shade300),
    );
  }

  OutlineInputBorder errorBorderDesign() {
    return OutlineInputBorder(
      gapPadding: 20,
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderClr ?? Colors.grey.shade300),
    );
  }
}
