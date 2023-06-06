import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../states/controller/home_controller.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/helper.dart';

class ContactUsScreen extends StatefulWidget {
  static String routeName = '/contactus';

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactUsScreen();
}

class _ContactUsScreen extends State<ContactUsScreen> {
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _messageCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  final HomeController _homeCon = Get.find<HomeController>();

  final List<String> _typeList = [
    'Orders',
    'Payment issue',
    'Inquiry',
    ' Other',
  ];
  late String name;
  late String email;
  late String phoneNo;
  late String subject;
  late String message;
  String subjectValue = 'Orders';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      /*    appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(30.h),
              const AppTitleBar(
                title: 'Contact Us',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addH(30.h),
                  CustomField(
                    hintText: 'Your name',
                    textCon: _nameCon,
                    inputType: TextInputType.name,
                    prefixIcon: 'assets/images/user_name.png',
                  ),
                  addH(10.h),
                  CustomField(
                    hintText: 'Email',
                    textCon: _emailCon,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: 'assets/images/mail.png',
                  ),
                  addH(10.h),
                  CustomField(
                    textCon: _phoneCon,
                    inputType: TextInputType.number,
                    hintText: 'Phone Number',
                    prefixIcon: 'assets/images/phone.png',
                  ),
                  addH(10.h),
                  /* CustomField(
                    hintText: 'Your name',
                    textCon: _nameCon,
                    inputType: TextInputType.name,
                    prefixIcon: 'assets/images/user_name.png',
                  ),*/
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black12, //<-- SEE HERE
                    ),
                    child: CustomDropDown(
                      initialValue: subjectValue,
                      itemList: _typeList,
                      onChangedFn: (value) =>
                          setState(() => subjectValue = value),
                    ),
                  ),
                  addH(10.h),
                  TextField(
                    maxLines: 12,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _messageCon,
                    keyboardType: TextInputType.name,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 10.w, top: 10.h, right: 10.h, bottom: 10.h),
                      disabledBorder: getInputBorder(),
                      border: getInputBorder(),
                      enabledBorder: getInputBorder(),
                      focusedBorder: getInputBorder(),
                      hintText: 'Type your message',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  addH(30.h),
                  CustomBtn(
                    btnFn: () => setState(() => _sendMessage()),
                    btnText: 'Send',
                    btnSize: Size(double.infinity, 52.h),
                    btnBgClr: ConstantColors.lightRed,
                    txtSize: 18,
                  ),
                  addH(20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_nameCon.text.isEmpty ||
        _emailCon.text.isEmpty ||
        _messageCon.text.isEmpty ||
        _phoneCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please fill all the fields!',
      );
      return;
    }
    if (!_emailCon.text.isEmail) {
      Methods.showSnackbar(
        msg: 'Please enter a valid email!',
      );

      return;
    }
    name = _nameCon.text;
    email = _emailCon.text;
    message = _messageCon.text;
    phoneNo = _phoneCon.text;
    _homeCon.postContactUsApi(name, email, subjectValue, phoneNo, message);
/*    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_contactUsController.addContactUsLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_contactUsController.addContact != null) {
              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
              });
              return const Text('Massage Sent');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      Get.back();
                    },
                    btnText: 'Try Again',
                    btnBgClr: Colors.green,
                    btnSize: Size(120.w, 40.h),
                  )
                ],
              );
            }
          }
        }),
        radius: 10.0);*/
  }
}
