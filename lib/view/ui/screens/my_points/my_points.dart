import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_prefix_image.dart';
import 'my_points_item.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyPointsScreen extends StatefulWidget {
  static String routeName = '/points';

  const MyPointsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPointsScreen();
}

class _MyPointsScreen extends State<MyPointsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      /*  appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(30.h),
              const AppTitleBar(
                title: 'My Points',
              ),
              addH(30.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
                    decoration: const BoxDecoration(
                      color: Colors.black, //<-- SEE HERE
                    ),
                    child: SizedBox(
                      height: 270.h,
                      width: 350.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addH(10.h),
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(10.h),
                                    Text(
                                      'member',
                                      style: TextStyle(
                                        color: ConstantColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                  ],
                                ),
                                addW(10.w),
                                TextWithPrefixIcon(
                                  imgUrl: 'assets/images/points_star.png',
                                  title: '3000 Points',
                                ),
                              ],
                            ),
                          ),
                          addH(8.h),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3000 Points',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: ConstantStrings.kAppFont,
                                  ),
                                ),
                                Text(
                                  '5000 Points',
                                  style: TextStyle(
                                    color: ConstantColors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: ConstantStrings.kAppFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LinearPercentIndicator(
                            width: 340.w,
                            lineHeight: 10.0,
                            percent: 0.5,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Earn 5000 coin(s) by 31/12/2022 to become a kallukosai Club Member',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: ConstantStrings.kAppFont,
                              ),
                            ),
                          ),
                          CustomBtn(
                            btnFn: () => setState(() => _checkOffers()),
                            btnText: 'Check Your Offers',
                            btnSize: Size(330.w, 50.h),
                            btnBgClr: ConstantColors.lightRed,
                            txtSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              addH(30.h),
              Container(
                margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
                child: Text(
                  'kallukosai Rewards',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return const MyPointsItem(

                        //  image: 'assets/images/address.png',
                        );
                  },
                ),
                //
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkOffers() {}
}
