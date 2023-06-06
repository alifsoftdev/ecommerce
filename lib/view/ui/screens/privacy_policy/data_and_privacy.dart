import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/home_controller.dart';
import '../../widgets/custom_app_titlebar.dart';

class PrivacyScreen extends StatefulWidget {
  static String routeName = '/privacy';

  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrivacyScreen();
}

class _PrivacyScreen extends State<PrivacyScreen> {
  final HomeController _homeCon = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _homeCon.getPrivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      /* appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),
*/
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(60.h),
              const AppTitleBar(
                title: 'Data and Privacy',
              ),
              addH(20.h),
              Obx(() {
                if (_homeCon.privacyLoadingFlag.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (_homeCon.privacyModel != null) {
                    return SingleChildScrollView(
                      primary: false,
                      child: HtmlWidget(
                        _homeCon.privacyModel!.content,
                        isSelectable: true,
                        onLoadingBuilder: (
                          context,
                          element,
                          loadingProgress,
                        ) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else {
                    return const Text(
                      'No data!',
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
