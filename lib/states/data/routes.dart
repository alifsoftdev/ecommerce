import 'package:get/route_manager.dart';
import '../../view/ui/screens/add_address/address_book.dart';
import '../../view/ui/screens/category/shop_by_department.dart';
import '../../view/ui/screens/checkout/checkout_payment.dart';
import '../../view/ui/screens/contact_us/contact_us.dart';
import '../../view/ui/screens/home/home.dart';
import '../../view/ui/screens/login/login.dart';
import '../../view/ui/screens/my_cart/my_cart_page.dart';
import '../../view/ui/screens/my_points/my_points.dart';
import '../../view/ui/screens/my_points/rewards.dart';
import '../../view/ui/screens/order/order_list.dart';
import '../../view/ui/screens/order/track_order.dart';
import '../../view/ui/screens/photo _search/photo_search_result.dart';
import '../../view/ui/screens/privacy_policy/data_and_privacy.dart';
import '../../view/ui/screens/product_by_category/product_by_category_page.dart';
import '../../view/ui/screens/product_details/product_details_page.dart';
import '../../view/ui/screens/product_page/product_page.dart';
import '../../view/ui/screens/profile/profile.dart';
import '../../view/ui/screens/register/register.dart';
import '../../view/ui/screens/search_result/search_result_page.dart';
import '../../view/ui/screens/splash/splash.dart';
import '../../view/ui/screens/thank_you/thank_you_page.dart';
import '../../view/ui/screens/wallet/add_payee_dialog.dart';
import '../../view/ui/screens/wallet/wallet_screen.dart';
import '../../view/ui/screens/wish_list/wish_list_screen.dart';
import '../bindings/bindings.dart';

class AllRoutes {
  static List<GetPage> allRoutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RegistrationScreen.routeName,
      page: () => const RegistrationScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AddressBook.routeName,
      page: () => const AddressBook(),
      binding: AddressBookBinding(),
    ),
   /* GetPage(
      name: AddAddress.routeName,
      page: () => const AddAddress(),
      binding: AddAddressBinding(),
    ),*/
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ProductPage.routeName,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: WishlistScreen.routeName,
      page: () => WishlistScreen(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: ProductByCategoryPage.routeName,
      page: () => const ProductByCategoryPage(),
      binding: ProductByCategoryPageBinding(),
    ),
    GetPage(
      name: ProductDetailsPage.routeName,
      page: () => const ProductDetailsPage(),
      binding: ProductDetailsPageBinding(),
    ),
    GetPage(
      name: MyCartPage.routeName,
      page: () => const MyCartPage(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: SearchResultPage.routeName,
      page: () => const SearchResultPage(),
      binding: ProductDetailsPageBinding(),
    ),
    GetPage(
      name: TrackOrder.routeName,
      page: () => const TrackOrder(),
      binding: TrackOrderBinding(),
    ),
    /*GetPage(
      name: BillingAddress.routeName,
      page: () => const BillingAddress(),
      binding: CheckoutPaymentBinding(),
    ),*/
    GetPage(
      name: ThankYouPage.routeName,
      page: () => const ThankYouPage(),
      binding: TrackOrderBinding(),
    ),
    GetPage(
      name: CheckoutPayment.routeName,
      page: () => const CheckoutPayment(),
      binding: CheckoutPaymentBinding(),
    ),
    GetPage(
      name: OrderList.routeName,
      page: () => const OrderList(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: PhotoSearchResult.routeName,
      page: () => const PhotoSearchResult(),
      binding: GQlHomeBinding(),
    ),
    GetPage(
      name: ContactUsScreen.routeName,
      page: () => const ContactUsScreen(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: PrivacyScreen.routeName,
      page: () => const PrivacyScreen(),
    ),
    GetPage(
      name: MyPointsScreen.routeName,
      page: () => const MyPointsScreen(),
      binding: MyPointsBinding(),
    ),
    GetPage(
      name: RewardsScreen.routeName,
      page: () => const RewardsScreen(),
      binding: RewardsScreenBinding(),
    ),
    GetPage(
      name: WalletScreen.routeName,
      page: () => const WalletScreen(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: AddPayeeDialog.routeName,
      page: () => const AddPayeeDialog(),
      binding: AddPayeeDialogBinding(),
    ),
    /*GetPage(
      name: ShippingMethods.routeName,
      page: () => const ShippingMethods(),
      binding: ShippingMethodsBinding(),
    ),*/
    GetPage(
      name: ShopByDepartmentPage.routeName,
      page: () => const ShopByDepartmentPage(),
      binding: ShopByDepartmentPageBinding(),
    ),
  ];
}
