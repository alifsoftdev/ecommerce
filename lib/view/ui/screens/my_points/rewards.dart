import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/my_points/rewards_history_item.dart';
import 'package:kallukoshai/view/ui/screens/my_points/rewards_rules_item.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/controller/rewards_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../widgets/custom_titlebar.dart';

class RewardsScreen extends StatefulWidget {
  static String routeName = '/rewards';

  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardsScreen();
}

class _RewardsScreen extends State<RewardsScreen> {
  final RewardsController _rewardsCon = Get.find<RewardsController>();
  final ProfileController _pCon = Get.find<ProfileController>();

  late String _adminToken;
  String _usrToken = '';

  @override
  void initState() {
    super.initState();
    _adminToken = Preference.getAdminToken();
    _usrToken = Preference.getUserToken();
    if (_adminToken.isNotEmpty) {
      _rewardsCon.getRewardsEarningMethods(_adminToken);
      _rewardsCon.getRewardsSpendingRules(_adminToken);
    }
    if (_usrToken.isNotEmpty) {
      _rewardsCon.getRewardsHistory(_usrToken);
    }
    _pCon.getProfileDetails(_usrToken, _adminToken, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitleBar(
          title: 'My Points',
          editIcon: '',
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1.0),
                      insets: EdgeInsets.symmetric(horizontal: 10.0)),
                  tabs: [
                    Tab(text: "My Points"),
                    Tab(
                      text: "History",
                    ),
                  ]),
              SizedBox(
                height: Get.height - 200,
                child: TabBarView(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addH(20.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: Obx(() {
                              if (_pCon.profileLoading.value ||
                                  _rewardsCon.earnRewardsLoadingFlag.value ||
                                  _rewardsCon.spendRewardsLoadingFlag.value) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      //  color: Colors.yellow,
                                      ),
                                );
                              } else {
                                if (_pCon.rewardPointsLoadingFlag.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current Balance',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ConstantStrings.kAppFont,
                                        ),
                                      ),
                                      addH(20.h),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              _pCon.rewardPoints,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Reward Points',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                      addH(20.h),
                                      Text(
                                        'How to earn points',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ConstantStrings.kAppFont,
                                        ),
                                      ),
                                      addH(20.h),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: _rewardsCon
                                            .earnRewardsModel!.items.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return RewardsRulesItem(
                                            frontName: _rewardsCon
                                                .earnRewardsModel!
                                                .items[index]
                                                .frontName,

                                            //  image: 'assets/images/address.png',
                                          );
                                        },
                                      ),
                                      addH(20.h),
                                      Text(
                                        'Spend points and receive discounts',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                ConstantStrings.kAppFont),
                                      ),
                                      addH(20.h),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: _rewardsCon
                                            .spendRewardsModel!.items.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return RewardsRulesItem(
                                            frontName: _rewardsCon
                                                .spendRewardsModel!
                                                .items[index]
                                                .frontName,

                                            //  image: 'assets/images/address.png',
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }
                              }
                            }),
                          ),
                          addH(30.h),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addH(20.h),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'My Reward Points',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: ConstantStrings.kAppFont,
                              ),
                            ),
                          ),
                          addH(10.h),
                          Obx(() {
                            if (_rewardsCon.rewardsHistoryLoadingFlag.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (_rewardsCon.rewardsHistoryList != null) {
                                return SizedBox(
                                  height: Get.height - 200,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    /* shrinkWrap: true,

                                  physics:
                                  const NeverScrollableScrollPhysics(),*/
                                    itemCount:
                                        _rewardsCon.rewardsHistoryList!.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return RewardsHistoryItem(
                                        rewardsHistoryItem: _rewardsCon
                                            .rewardsHistoryList![index],

                                        //  image: 'assets/images/address.png',
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text('No transactions available'));
                              }
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkOffers() {}
}
