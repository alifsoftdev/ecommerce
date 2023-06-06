import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../widgets/custom_titlebar.dart';
import '../add_address/add_address.dart';
import '../add_address/address_item.dart';

class AddressBook extends StatefulWidget {
  static String routeName = '/address_book';

  const AddressBook({Key? key}) : super(key: key);

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  final ProfileController _pCon = Get.find<ProfileController>();
  late String _usrToken;

  @override
  void initState() {
    super.initState();
    _usrToken = Preference.getUserToken();
    _pCon.getProfileDetails(_usrToken, "", false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*     appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 55, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTitleBar(
                title: 'Address Book',
                editIcon: '',
              ),
              addH(20.h),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        /*Get.offAndToNamed(AddAddress.routeName)!.then(
                          (value) =>
                              _pCon.getProfileDetails(_usrToken, "", false),
                        );*/
                      },
                      child: Text(
                        'Add Address Book',
                        style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            color: Colors.black,
                            fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ),
              addH(30.h),
              Obx(() {
                if (_pCon.profileLoading.value) {
                  return Padding(
                    padding: EdgeInsets.only(top: 280.h),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_pCon.userProfile != null) {
                    if (_pCon.userProfile!.addresses.isNotEmpty) {
                      return SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _pCon.userProfile!.addresses.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return AddressItem(

                              isSelectFlag: false, addressModel: null,
                              //  image: 'assets/images/address.png',
                            );
                          },
                        ),
                        //
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 280.h),
                        child: const Center(
                          child: Text('Address list is empty'),
                        ),
                      );
                    }
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 280.h),
                      child: const Center(
                        child: Text('Profile not found'),
                      ),
                    );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
