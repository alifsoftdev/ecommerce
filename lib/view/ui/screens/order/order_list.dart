import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/orders_totals_controller.dart';
import '../../widgets/custom_titlebar.dart';
import 'order_list_item.dart';

class OrderList extends StatefulWidget {
  static String routeName = '/order_list';

  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final GetOrdersTotalController _getOrdersTotalController =
      Get.put(GetOrdersTotalController());

  @override
  void initState() {
    super.initState();
    _getOrdersTotalController.getMyOrders();
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
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(45.h),
              const CustomTitleBar(
                title: 'My Order',
                editIcon: '',
              ),
              addH(20.h),
              Obx(() {
                if (_getOrdersTotalController.getOrdersLoadingFlag.value) {
                  return Padding(
                    padding: EdgeInsets.only(top: 330.h),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_getOrdersTotalController.myOrdersModel != null) {
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _getOrdersTotalController
                            .myOrdersModel!.items.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderItem(
                            ordersItem: _getOrdersTotalController
                                .myOrdersModel!.items[index],
                          );
                        },
                      ),
                      //
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 330.h),
                      child: const Center(
                        child: Text(
                          'Orders not found',
                        ),
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
