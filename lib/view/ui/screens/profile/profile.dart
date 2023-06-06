import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/address_controller.dart';
import '../../../../states/controller/cart_totals_controller.dart';
import '../../../../states/controller/orders_totals_controller.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/model/edit_password_model.dart';
import '../../../../states/model/profile_model.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/container_with_text_image.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_profile_titlebar.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/user_profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel? userProfile;

  String _usrToken = '';

  final ProfileController _pCon = Get.find<ProfileController>();
  final GetCartTotalsController _cCon = Get.find<GetCartTotalsController>();
  final WishlistController _wCon = Get.find<WishlistController>();
  final GetOrdersTotalController _oCon = Get.find<GetOrdersTotalController>();
  final AddressController _aCon = Get.find<AddressController>();

  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();

  bool _editFlag = false;

  @override
  void initState() {
    super.initState();
    _usrToken = Preference.getUserToken();
    _passCon.text = Preference.getLoginPass();
    _pCon.getProfileDetails(_usrToken, "", false);
    _cCon.getCartTotals(_usrToken);
    _wCon.getWishlist(_usrToken);
    _oCon.getOrdersTotal(Preference.getAdminToken());
    // _oCon.getMyOrders();
    _aCon.profileUpdating.listen((value) {
      if (!value && _aCon.profileUpdated) {
        if (_aCon.addAddressResObj != null && _aCon.profileUpdated) {
          Methods.showSnackbar(
            icon: Icons.check,
            title: 'Profile Updated!',
            msg: 'You have successfully updated your information!',
          );
        }
        Future.delayed(
          const Duration(seconds: 2),
          () {
            setState(() {
              Get.back();
              _pCon.getProfileDetails(_usrToken, "", false);
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /* systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),*/
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomProfileTitleBar(
          getFlagFn: (value) => setState(
            () => _editFlag = value,
          ),
          onTapFn: () => _updateProfile(),
          title: "My Account",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Obx(() {
            if (_pCon.profileLoading.value ||
                _cCon.getCartTotalsLoadingFlag.value ||
                _wCon.getWishlistLoadingFlag.value ||
                _oCon.getOrdersTotalLoadingFlag.value) {
              return const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (_pCon.userProfile == null) {
                return const Text(
                  'Something went wrong!',
                );
              } else {
                _fNameCon.text = _pCon.userProfile!.firstname;
                _lNameCon.text = _pCon.userProfile!.lastname;
                _emailCon.text = _pCon.userProfile!.email;
                for (var item in _pCon.userProfile!.addresses) {
                  if (item.defaultBilling) {
                    _phoneCon.text = item.telephone;
                    break;
                  }
                }
                return Column(
                  children: [
                    addH(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 115.w,
                              height: 115.h,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  // user image
                                  Container(
                                    width: 115.w,
                                    height: 115.h,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  // photo uploading btn
                                  InkWell(
                                    //   onTap: () => _selectImage(),
                                    //   splashColor: Colors.white,
                                    //   highlightColor: Colors.white,
                                    child: Container(
                                      width: 36.w,
                                      height: 36.h,
                                      margin: EdgeInsets.only(
                                        bottom: 5.h,
                                        right: 5.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(20.h),
                            // first & last name
                            Text(
                              "${_pCon.userProfile!.firstname} ${_pCon.userProfile!.lastname}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ConstantStrings.kAppFont),
                            ),
                            addH(10.h),
                            Text(
                              _pCon.userProfile == null ||
                                      _pCon.userProfile!.addresses.isEmpty
                                  ? 'No Address'
                                  : "${_pCon.userProfile!.addresses[0].street[0]},${_pCon.userProfile!.addresses[0].city}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: ConstantStrings.kAppFont),
                            ),
                            addH(15.h),
                          ],
                        ),
                      ],
                    ),
                    addH(10.h),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomBoxWithTextAndImage(
                                title: 'My Cart',
                                imgUrl: 'assets/images/cart.png',
                                number: _cCon.cartTotals == null
                                    ? '0'
                                    : _cCon.cartTotals!.itemsQty.toString(),
                              ),
                              CustomBoxWithTextAndImage(
                                title: 'Favourite',
                                imgUrl: 'assets/images/favourite.png',
                                number: _wCon.wishlistModel == null
                                    ? '0'
                                    : _wCon.wishlistModel!.itemsCount
                                        .toString(),
                              ),
                              CustomBoxWithTextAndImage(
                                title: 'Order',
                                imgUrl: 'assets/images/star.png',
                                number: _oCon.ordersTotal == null
                                    ? '0'
                                    : _oCon.ordersTotal!.totalCount.toString(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        addH(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 16.sp,
                                    color: HexColor(
                                      '#656E72',
                                    )),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: _editFlag,
                                textCon: _fNameCon,
                                inputType: TextInputType.name,
                                hintText: 'First name',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 16.sp,
                                    color: HexColor(
                                      '#656E72',
                                    )),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: _editFlag,
                                textCon: _lNameCon,
                                inputType: TextInputType.name,
                                hintText: 'Last Name',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),
                        //  addH(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 16.sp,
                                    color: HexColor(
                                      '#656E72',
                                    )),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: _editFlag,
                                textCon: _emailCon,
                                inputType: TextInputType.name,
                                hintText: 'test@royex.net',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 16.sp,
                                  color: HexColor(
                                    '#656E72',
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: _editFlag,
                                textCon: _phoneCon,
                                inputType: TextInputType.number,
                                hintText: '12345679',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Language',
                                style: TextStyle(
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 16.sp,
                                  color: HexColor(
                                    '#656E72',
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: false,
                                textCon: TextEditingController(text: "English"),
                                inputType: TextInputType.name,
                                hintText: 'English',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 16.sp,
                                  color: HexColor(
                                    '#656E72',
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: CustomField(
                                isEnabled: _editFlag,
                                textCon: _passCon,
                                inputType: TextInputType.visiblePassword,
                                hintText: '********',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: HexColor('#E5EBF1')),
                        addH(20.h),
                      ],
                    ),
                  ],
                );
              }
            }
          }),
        ),
      ),
    );
  }

  void _updateProfile() {
    ProfileModel profileModel = _pCon.userProfile!;

    for (var item in profileModel.addresses) {
      if (item.defaultBilling) {
        item.telephone = _phoneCon.text;
        break;
      }
    }

    AddAddressModel addressM = AddAddressModel(
      customer: Customer(
        id: profileModel.id,
        groupId: profileModel.groupId,
        defaultBilling: profileModel.defaultBilling,
        defaultShipping: profileModel.defaultShipping,
        createdAt: profileModel.createdAt,
        updatedAt: profileModel.updatedAt,
        createdIn: profileModel.createdIn,
        email: _emailCon.text,
        firstname: _fNameCon.text,
        lastname: _lNameCon.text,
        gender: profileModel.gender,
        storeId: profileModel.storeId,
        websiteId: profileModel.websiteId,
        addresses: profileModel.addresses,
      ),
    );
    EditPasswordModel editPasswordModel = EditPasswordModel(
      currentPassword: Preference.getLoginPass(),
      newPassword: _passCon.text,
    );
    _aCon.addAddress(
      _usrToken,
      addressM,
      editPasswordModel: editPasswordModel,
    );
  }
}
