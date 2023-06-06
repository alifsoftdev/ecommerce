import 'package:get/get.dart';
import '../controller/address_controller.dart';
import '../controller/cart_totals_controller.dart';
import '../controller/home_controller.dart';
import '../controller/login_controller.dart';
import '../controller/my_cart_controller.dart';
import '../controller/orders_totals_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/registration_controller.dart';
import '../controller/rewards_controller.dart';
import '../controller/store_controller.dart';
import '../controller/track_order_controller.dart';
import '../controller/wishlist_controller.dart';
import '../graphQL/controller/home_controller.dart';
import '../graphQL/controller/wallet_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => MyCartController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => StoreController());
  }
}

class GQlHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeControllerGraphql());
  }
}

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}

class ProductByCategoryPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => HomeController());
  }
}

class ProductDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => MyCartController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => WishlistController());
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => GetOrdersTotalController());
    Get.lazyPut(() => GetCartTotalsController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => WalletController());
  }
}

class AddAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AddressController());
  }
}

class AddressBookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AddressController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class TrackOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}

class CheckoutPaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => ProfileController());
  }
}

class MyCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCartController());
    Get.lazyPut(() => LoginController());
  }
}

class OrderListBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GetWishlistController());
  }
}

class MyPointsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GetWishlistController());
  }
}

class RewardsScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => RewardsController());
  }
}

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => MyCartController());
  }
}

class AddPayeeDialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => ProfileController());
  }
}

class ShippingMethodsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => PaymentController());
  }
}

class ShopByDepartmentPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => WishlistController());
  }
}
