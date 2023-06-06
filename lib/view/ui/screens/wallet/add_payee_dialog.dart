import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/wallet/wallet_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/graphQL/controller/wallet_controller.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_field.dart';

class AddPayeeDialog extends StatefulWidget {
  static String routeName = '/add_payee';

  const AddPayeeDialog({super.key});

  @override
  State<AddPayeeDialog> createState() => _AddPayeeDialogState();
}

class _AddPayeeDialogState extends State<AddPayeeDialog> {
  final WalletController _walletCon = Get.find<WalletController>();
  final ProfileController _pCon = Get.find<ProfileController>();

  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _confirmEmailCon = TextEditingController();

  // ProfileModel? userProfile;

  String _usrToken = '';

  @override
  void initState() {
    _usrToken = Preference.getUserToken();

    Future.delayed(
      const Duration(milliseconds: 80),
      () {
        _pCon.getProfileDetails(_usrToken, "", false);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(WalletScreen.routeName);
        return true;
      },
      child: Scaffold(
        body: /*GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: */
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter Payee Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: ConstantStrings.kAppFont),
              ),
              addH(30.h),
              CustomField(
                hintText: 'Nick Name',
                textCon: _nameCon,
                inputType: TextInputType.name,
                //   prefixIcon: 'assets/images/mail.png',
                fillClr: Colors.white,
                brdrClr: Colors.grey.shade200,
                brdrRadius: 0,
              ),
              addH(20.h),
              CustomField(
                hintText: 'Email Address',
                textCon: _emailCon,
                inputType: TextInputType.emailAddress,
                //   prefixIcon: 'assets/images/mail.png',
                fillClr: Colors.white,
                brdrClr: Colors.grey.shade200,
                brdrRadius: 0,
              ),
              addH(20.h),
              CustomField(
                hintText: 'Confirm Email Address',
                textCon: _confirmEmailCon,
                inputType: TextInputType.emailAddress,
                //   prefixIcon: 'assets/images/mail.png',
                fillClr: Colors.white,
                brdrClr: Colors.grey.shade200,
                brdrRadius: 0,
              ),
              addH(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBtn(
                    btnFn: () {
                      _addPayee();
                    },
                    btnText: 'Submit',
                    btnBgClr: ConstantColors.lightRed,
                    txtSize: 18,
                    btnSize: Size(120.w, 40.h),
                  ),
                  CustomBtn(
                    btnFn: () {},
                    btnText: 'Reset',
                    btnBgClr: ConstantColors.lightRed,
                    txtSize: 18,
                    btnSize: Size(120.w, 40.h),
                  ),
                ],
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }

  void _addPayee() {
    if (_nameCon.text.isEmpty ||
        _emailCon.text.isEmpty ||
        _confirmEmailCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please fill all the empty fields!',
      );
      return;
    }
    if (_emailCon.text != _confirmEmailCon.text) {
      Methods.showSnackbar(
        msg: 'Email do not match!',
      );
      return;
    }

    if (_pCon.userProfile != null) {
      _walletCon.addPayeeApi(_pCon.userProfile!.id, _nameCon.text,
          _emailCon.text, _confirmEmailCon.text); // this is the api call ok

      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Obx(() {
                if (_walletCon.addPayeeLoadingFlag.value) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  Future.delayed(const Duration(seconds: 2), () async {
                    Get.back();
                    Get.back();
                    _walletCon.getPayeeListApi(_pCon.userProfile!.id);
                  });
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: ConstantColors.lightGray,
                      border: Border.all(
                        width: 1.0,
                        // assign the color to the border color
                        color: ConstantColors.lightGray,
                      ),
                    ),
                    height: 50,
                    child: Center(
                        child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      _walletCon.title.value,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    )),
                  );
                }
              }),
              /*   child: SizedBox(
                  height: Get.height * 0.5,
                  child: AddPayeeDialog(),
                ),*/
            );
          });

      /*    Future.delayed(
        const Duration(seconds: 9),
        () {
          setState(() {

          });
        },
      );*/
    }
  }
}
