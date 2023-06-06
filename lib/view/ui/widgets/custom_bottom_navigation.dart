import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../states/data/prefs.dart';
import '../../../states/utils/methods.dart';
import '../screens/category/shop_by_department.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/my_cart/my_cart_page.dart';
import '../screens/product_by_category/product_by_category_page.dart';
import 'nav_icon.dart';

class CustomBottomNavigation extends StatefulWidget {
  int selectedNavIndex;
  CustomBottomNavigation({
    Key? key,
    required this.selectedNavIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  bool _loginFlag = false;
  int get selectedNavIndex => widget.selectedNavIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavIcon(
            isSelected: selectedNavIndex == 0,
            icon: 'assets/svg/explore.svg',
            title: 'Explore',
            onTapFn: () => setState(() {
              widget.selectedNavIndex = 0;
              Get.toNamed(
                ShopByDepartmentPage.routeName,
              );
              // Get.to(HomeScreen());
            }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 1,
            icon: 'assets/svg/category.svg',
            title: 'Categories',
            onTapFn: () => setState(() {
              widget.selectedNavIndex = 1;
              // Get.toNamed(SearchResultPage.routeName);
              Get.toNamed(
                ProductByCategoryPage.routeName,
                arguments: [79],
              );
            }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 2,
            icon: 'assets/svg/home.svg',
            title: 'Home',
            onTapFn: () => setState(() {
              widget.selectedNavIndex = 2;
              Get.to(const HomeScreen());
            }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 3,
            icon: 'assets/svg/cart.svg',
            title: 'Cart',
            onTapFn: () => setState(() {
              widget.selectedNavIndex = 3;
              _loginFlag = Preference.getLoggedInFlag();
              String token = Preference.getGuestUserToken();
              if (_loginFlag || token.isNotEmpty) {
                Get.toNamed(MyCartPage.routeName);
              } else {
                Methods.showSnackbar(msg: 'Please login first!');
                Get.toNamed(LoginScreen.routeName);
              }
            }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 4,
            icon: 'assets/svg/more.svg',
            title: 'More',
            onTapFn: () => setState(() {
              widget.selectedNavIndex = 4;

              Scaffold.of(context).openDrawer();
            }),
          ),
        ],
      ),
    );
  }
}
