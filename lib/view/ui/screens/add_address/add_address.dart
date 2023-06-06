
/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/address_controller.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/methods/all_methods.dart';
import '../../../../states/model/add_shipping_address_model.dart';
import '../../../../states/model/country_model.dart';
import '../../../../states/model/profile_model.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_drop_down_list.dart';
import '../../widgets/custom_email_text_field.dart';
import '../../widgets/custom_titlebar.dart';
import 'address_book.dart';

class AddAddress extends StatefulWidget {
  static String routeName = '/add_address';

  const AddAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  CountryModel? _selectedCountry;

  Address? addressModel;
  Address? guestAddress;

  final ProfileController _pCon = Get.find<ProfileController>();

  final AddressController _aCon = Get.find<AddressController>();

  String addressType = "shipping_address";
  bool isShippingAddress = true;

  String _usrToken = '';
  var amount;

  List<dynamic> _cData = [];
  final TextEditingController _emailCon = TextEditingController();

  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _phoneCOn = TextEditingController();
  final TextEditingController _addressCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();
  final TextEditingController _apartmentCon = TextEditingController();
  final TextEditingController _zipCon = TextEditingController();
  bool _loginFlag = false;

  @override
  void initState() {
    _usrToken = Preference.getUserToken();
    _loginFlag = Preference.getLoggedInFlag();
    if (_aCon.countryList.isEmpty) {
      _aCon.getCountryList();
    }
    if (!_loginFlag) {
      _pCon.profileLoading.value = false;
    }
    if (Get.arguments != null) {
      _cData = Get.arguments;
      amount = Get.arguments[0];
      addressModel = Get.arguments[1];
      if (addressModel != null) {
        _fNameCon.text = addressModel!.firstname;
        _lNameCon.text = addressModel!.lastname;
        _addressCon.text = addressModel!.street.first;
        _phoneCOn.text = addressModel!.telephone;
        _cityCon.text = addressModel!.city;
        _apartmentCon.text = addressModel!.street.last;
        _zipCon.text = addressModel!.postcode;
        for (CountryModel item in _aCon.countryList) {
          if (item.id == addressModel!.countryId) {
            _selectedCountry = item;
            break;
          }
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitleBar(
          title: "Add or Edit Address",
          editIcon: '',
        ),
      ),
      body: Obx(() {
        if (_pCon.profileLoading.value || _aCon.countryListLoadingFlag.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          //   if (_pCon.userProfile != null) {
          if (_aCon.countryList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addH(30.h),
                    Text(
                      'Where Should we Delivery Your Order?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                    /*  addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Email Address',
                      imagePath: 'assets/images/mail.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'Email Address';
                      },
                      textEditingController: _emailAddressEditingController,
                    ),*/
                    //getEmailFields(),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'First Name',
                      imagePath: 'assets/images/user_name.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'First Name';
                        return null;
                      },
                      textEditingController: _fNameCon,
                    ),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Last Name',
                      imagePath: 'assets/images/user_name.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'Last Name';
                        return null;
                      },
                      textEditingController: _lNameCon,
                    ),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Apartment/Villa Number',
                      imagePath: 'assets/images/address.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Apartment/Villa Number';
                        }
                        return null;
                      },
                      textEditingController: _apartmentCon,
                    ),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Address Title',
                      imagePath: 'assets/images/address.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'Address Title';
                        return null;
                      },
                      textEditingController: _addressCon,
                    ),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'City',
                      imagePath: 'assets/images/map_pin.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'City';
                        return null;
                      },
                      textEditingController: _cityCon,
                    ),

                    addH(20.h),
                    CustomDropDownList(
                      givenValue: _selectedCountry,
                      hintTxt: 'Select Country',
                      items: _aCon.countryList.map((e) {
                        return AllMethods.getDDMenuItem(
                          item: e,
                          txt: e.fullNameEnglish,
                        );
                      }).toList(),
                      onChangedFn: (value) => setState(() {
                        _selectedCountry = value!;
                        print(value);
                      }),
                    ),
                    //    Obx(() {
                    // /*     if (_addAddressController
                    //          .countryListLoadingFlag.value) {
                    //        return SizedBox(
                    //          height: 50.h,
                    //          width: 300.w,
                    //          child: const Center(
                    //            child: CircularProgressIndicator(),
                    //          ),
                    //        );
                    //      } */
                    // //else {
                    //       // if (_addAddressController.countryList.isNotEmpty) {
                    //          if (addressModel != null) {
                    //            for (CountryModel item
                    //                in _addAddressController.countryList) {
                    //              if (item.id ==
                    //                  addressModel!.countryId) {
                    //                _selectedCountry = item;
                    //                break;
                    //              }
                    //            }
                    //          }
                    //          return CustomDropDownList(
                    //            givenValue: _selectedCountry,
                    //            hintTxt: 'Select Country',
                    //            items:
                    //                _addAddressController.countryList.map((e) {
                    //              return AllMethods.getDDMenuItem(
                    //                item: e,
                    //                txt: e.fullNameEnglish,
                    //              );
                    //            }).toList(),
                    //            onChangedFn: (value) => setState(() {
                    //              _selectedCountry = value!;
                    //              print(value);
                    //            }),
                    //          );
                    //      /*  } else {
                    //          return const Text('no data found');
                    //        }*/
                    //     // }
                    //    }),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Zip Code',
                      imagePath: 'assets/images/phone.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'Zip Code';
                        return null;
                      },
                      textEditingController: _zipCon,
                    ),
                    addH(20.h),
                    CustomEmailTextField(
                      hintTxt: 'Phone Number',
                      imagePath: 'assets/images/phone.png',
                      inputType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) return 'Phone Number';
                        return null;
                      },
                      textEditingController: _phoneCOn,
                    ),
                    addH(20.h),

                    RadioListTile(
                      title: Text(
                        "Shipping Address",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                      value: "shipping_address",
                      groupValue: addressType,
                      dense: true,
                      onChanged: (value) {
                        setState(() {
                          addressType = value.toString();
                          isShippingAddress = true;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        "Billing Address",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                      value: "billing_address",
                      groupValue: addressType,
                      dense: true,
                      onChanged: (value) {
                        setState(() {
                          addressType = value.toString();
                          isShippingAddress = false;
                        });
                      },
                    ),
                    addH(20.h),

                    CustomBtn(
                      btnSize: Size(338.w, 52.h),
                      btnFn: () {
                        if (_loginFlag) {
                          _addAddress();
                        } else {
                          addShippingAddress();
                        }

                        //Get.to(AddressBook());
                      },
                      btnText: 'Save',
                      btnBgClr: HexColor('#F04930'),
                    ),
                    addH(20.h),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Country list not found');
          }
          /* } else {
            return const Center(child: Text('Profile not found'));
          }*/
        }
      }),
    );
  }

  void _addAddress() {
    ProfileModel profileModel = _pCon.userProfile!;
    List<Address> userAddress = profileModel.addresses;
    List<String> streetList = [_addressCon.text, _apartmentCon.text];
    Region region = Region(
      region: _cityCon.text,
      regionId: 0,
      regionCode: '0',
    );

    Address address = Address(
      id: addressModel != null ? addressModel!.id : 0,
      customerId: 0,
      region: region,
      countryId: _selectedCountry != null ? _selectedCountry!.id : '',
      street: streetList,
      telephone: _phoneCOn.text,
      postcode: _zipCon.text,
      city: _cityCon.text,
      firstname: _fNameCon.text,
      lastname: _lNameCon.text,
      regionId: 0,
      defaultShipping:
          (userAddress.isEmpty) ? true : (isShippingAddress ? true : false),
      defaultBilling:
          (userAddress.isEmpty) ? true : (isShippingAddress ? false : true),
    );

    userAddress.add(address);
    profileModel.addresses = userAddress;

    AddAddressModel addressM = AddAddressModel(
      customer: Customer(
        id: Preference.getUserIdFlag(),
        groupId: profileModel.groupId,
        defaultBilling: profileModel.defaultBilling,
        defaultShipping: profileModel.defaultShipping,
        createdAt: profileModel.createdAt ?? DateTime.now(),
        updatedAt: profileModel.updatedAt ?? DateTime.now(),
        createdIn: profileModel.createdIn,
        email: profileModel.email,
        firstname: profileModel.firstname,
        lastname: profileModel.lastname,
        gender: profileModel.gender,
        storeId: profileModel.storeId,
        websiteId: profileModel.websiteId,
        addresses: userAddress,
      ),
    );

    _aCon.addAddress(
      _usrToken,
      addressM,
    );

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_aCon.addAddressLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_aCon.addAddressResObj != null) {
              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
                Get.offAndToNamed(AddressBook.routeName);
              });
              return const Text('Address added successfully');
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
        radius: 10.0);
  }

  Future<void> addShippingAddress() async {
    List<String> streetList = [_addressCon.text, _apartmentCon.text];

    Region region = Region(
      region: _cityCon.text,
      regionId: 0,
      regionCode: '0',
    );

    AddShippingAddressModel addShippingAddressModel = AddShippingAddressModel(
      address: AddShippingAddress(
        region: region.region,
        regionId: region.regionId,
        regionCode: region.regionCode,
        countryId: _selectedCountry!.id,
        street: streetList,
        postcode: _zipCon.text,
        city: _cityCon.text,
        firstname: _fNameCon.text,
        lastname: _lNameCon.text,
        email: _emailCon.text,
        telephone: _phoneCOn.text,
        customerId: null,
        sameAsBilling: 1,
      ),
    );
    guestAddress = Address(
        id: null,
        customerId: null,
        region: region,
        regionId: region.regionId,
        countryId: _selectedCountry!.id,
        street: streetList,
        email: _emailCon.text,
        telephone: _phoneCOn.text,
        postcode: _zipCon.text,
        city: _cityCon.text,
        firstname: _fNameCon.text,
        lastname: _lNameCon.text,
        defaultShipping: true,
        defaultBilling: true);
    bool isAdded = await _aCon.addShippingAddress(
      addShippingAddressModel,
    );
*/