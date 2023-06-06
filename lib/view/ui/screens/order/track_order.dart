import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/track_order_controller.dart';
import '../../widgets/container_gray_background.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_titlebar.dart';
import 'order_track_item.dart';

class TrackOrder extends StatefulWidget {
  static String routeName = '/track_order';

//final MyOrdersModelItem? ordersItem;
  const TrackOrder({
    Key? key, //this.ordersItem,
  }) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final int _selectedNavIndex = 2;
  final TrackOrderController _myCartController =
      Get.find<TrackOrderController>();

  String? orderId;

  @override
  void initState() {
    orderId = Get.arguments[0].toString();
    _myCartController.getOrderStatus(orderId!);
    _myCartController.getMyOrderDetails(orderId!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
      ),
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 10),
        child: SingleChildScrollView(
          child: Obx(() {
            if (_myCartController.myOrderDetailsLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_myCartController.orderDetails != null) {
                return Column(
                  children: [
                    const CustomTitleBar(
                      title: 'Order Track ',
                      editIcon: '',
                    ),
                    addH(20.h),
                    ContainerGrayBackground(
                      orderId: orderId,
                      date: DateFormat('dd MMMM, yyyy').format(
                        _myCartController.orderDetails!.createdAt,
                      ),
                      amount: _myCartController.orderDetails!.subtotalInclTax
                          .toDouble(),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 30.h,
                        right: 30.h,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/timer.png',
                          ),
                          addW(20.w),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estimated Delivery Time',
                                style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    color: HexColor('#656E72'),
                                    fontSize: 14.sp),
                              ),
                              addH(10.h),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  DateFormat('dd MMMM, yyyy').format(
                                    _myCartController.orderDetails!.createdAt
                                        .add(const Duration(days: 5)),
                                  ),
                                  style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      color: Colors.black,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    addH(30.h),
                    OrderTrackItem(
                      image: _myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Pending',
                      ),
                      title: 'Pending',
                      dividerColor: '#000000',
                      status: 'Your order has been successfully verified.',
                      date: DateFormat('dd/MM/yyyy').format(
                        _myCartController.orderDetails!.createdAt,
                      ),
                      stauts: _myCartController.status,
                    ),
                    OrderTrackItem(
                      image: _myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Processing',
                      ),
                      title: 'Processing',
                      dividerColor: '#000000',
                      status: _myCartController
                              .showStatus(_myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Processing',
                      ))
                          ? 'Your package has been packed, over to a logistics partner.'
                          : '',
                      date: _myCartController
                              .showStatus(_myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Processing',
                      ))
                          ? DateFormat('dd/MM/yyyy').format(
                              _myCartController.orderDetails!.updatedAt,
                            )
                          : '',
                      stauts: _myCartController.orderDetails!.status,
                    ),
                    OrderTrackItem(
                      image: _myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Shipped',
                      ),
                      title: 'Shipped',
                      dividerColor: '#000000',
                      status: _myCartController
                              .showStatus(_myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Shipped',
                      ))
                          ? 'Your package has been shipped. '
                          : '',
                      date: _myCartController
                              .showStatus(_myCartController.getImage(
                        _myCartController.orderDetails!.status,
                        'Shipped',
                      ))
                          ? DateFormat('dd/MM/yyyy').format(
                              _myCartController.orderDetails!.updatedAt,
                            )
                          : '',
                      stauts: _myCartController.orderDetails!.status,
                    ),
                    OrderTrackItem(
                        image: _myCartController.getImage(
                            _myCartController.orderDetails!.status,
                            'Completed'),
                        title: 'Completed',
                        dividerColor: '#ffffff',
                        status: ' ',
                        date: ' ',
                        stauts: _myCartController.orderDetails!.status),
                  ],
                );
              } else {
                return const Center(child: Text('Order details not found'));
              }
              //  } else {
              return const Center(child: Text('status not found'));
              // }
            }
            //   }
          }),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: _selectedNavIndex,
      ),
    );
  }
}
