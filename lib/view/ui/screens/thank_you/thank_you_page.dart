import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/strings.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/helper.dart';
import '../home/home.dart';

class ThankYouPage extends StatefulWidget {
  static String routeName = '/thankYou';

  const ThankYouPage({Key? key}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  // final MyCartController _myCartController = Get.find<MyCartController>();

  String? orderId;
  @override
  void initState() {
    orderId = Get.arguments[0].replaceAll('"', '');
    print('oorderid ${Get.arguments[0]}');
/*
    _myCartController.getMyOrderDetails(Get.arguments[0]);
*/
    //_myCartController.getMyOrderDetails(orderId!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: // Obx(() {
            /* if (_myCartController.myOrderDetailsLoadingFlag.value) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          } else {*/
            /*  if (_myCartController.orderDetails != null) {
              return*/
            Column(
          children: [
            addH(15.h),
            const AppTitleBar(
              title: 'Order Confirmation',
            ),
            addH(40.h),
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(
                'assets/images/check_circle.png',
              ),
            ),
            Center(
                child: Text(
              'THANK YOU',
              style: TextStyle(
                  fontSize: 41.sp,
                  fontFamily: ConstantStrings.kAppFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )),
            addH(25.h),
            const Center(
                child: Text(
              'Your Order has been Received',
              style: TextStyle(
                color: Colors.grey,
              ),
            )),
            addH(10.h),
            Center(
              child: Text(
                'Order Number: #${orderId!}',
              ),
            ),
            addH(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*     InkWell(
                        onTap: () => Get.offAllNamed(
                          TrackOrder.routeName,
                          arguments: [orderId],
                        ),
                        child: Container(
                          height: 40.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors.lightGray,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Text(
                                'Track your Order',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      addW(20.w),*/
                CustomBtn(
                  btnFn: () => Get.offAllNamed(
                    HomeScreen.routeName,
                  ),
                  btnText: 'Continue Shopping',
                  btnBgClr: Colors.red,
                  txtColor: Colors.white,
                  btnSize: Size(200.w, 40.h),
                )
              ],
            ),
          ],
        ),
        //   } else /*{
        /*  return const Center(
                child: Text(
                  'Data not found',
                ),
              );*/
        // }
        //  }
        //  }),
      ),
    );
  }
}
