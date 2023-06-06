import '../states/data/prefs.dart';

class ConstantStrings {
  //fonts
  static String kAppFont = 'DMSans';

  //api
  static String kBaseUrl = 'http://kallukosai.bgm.me/rest';
  static String kImageUrl = 'http://kallukosai.bgm.me/media/catalog/product';
  static String kBannerUrl = 'http://kallukosai.bgm.me/media/';
  static String kSubCategoryImageUrl = 'http://kallukosai.bgm.me/';

  static String kProductApi = '/V1/products?';
  static String kBannerListApi = '/V1/cmsBlock/108';
  static String kCategoriesListApi = '/V1/cmsBlock/98';
  static String kDepartmentListApi = '/V1/cmsBlock/110';
  static String kMyCartApi = '/V1/carts/mine/totals';
  static String kCategoryDetailsApi = '/V1/categories/';

  static String kGuestCartApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/totals';
  static String kMyOrderDetailsApi = '/V1/orders';
  static String kCartQuoteApi = '/V1/carts/mine';
  static String kMyCartListApi = '/V1/carts/mine/items';
  static String kMyGuestCartListApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/items';
  static String kCouponCodeUserApi = '/V1/carts/mine/coupons';
  static String kCouponCodeGuestApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/coupons';
  static String kAddToCartApi = '/V1/carts/mine/items';
  static String kGuestAddToCartApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/items';
  static String kCategoryApi = '/V1/categories/list?';
  static String kLoginApi = '/V1/integration/customer/token';
  static String kAdminTokenApi = '/V1/integration/admin/token';
  static String kGuestUserTokenApi = '/V1/guest-carts';
  static String kRegistrationApi = '/V1/customers';
  static String kPaymentInfoApi = '/V1/carts/mine/shipping-information';
  static String kCreateOrderApi = '/V1/carts/mine/payment-information';
  static String kGetCountryListApi = '/V1/directory/countries';
  static String kAddShippingAddressApi =
      '/V1/carts/mine/estimate-shipping-methods';

  static String kGuestAddShippingAddressApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/estimate-shipping-methods';
  static String kGuestCreateOrderApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/payment-information';

  static String kGuestShippingInformationApi =
      '/V1/guest-carts/${Preference.getGuestUserToken().replaceAll('"', '')}/shipping-information';
  static String kStoreProductDetailsApi = '/V1/products';
  static String kGetProfileApi = '/V1/customers/me';
  static String kGetWishlistApi = '/V1/wishlist';
  static String kGetCartTotalsApi = '/V1/carts/mine/totals';
  static String kEditPasswordApi = '/V1/customers/me/password';
  static String kPrivacyPolicyApi = '/V1/cmsPage/29';
  static String kContactUsApi = '/V1/contactus?';
  static String kEarnRewardsRulesApi = '/V1/rewards/earningRules';
  static String kSpendRewardsRulesApi = '/V1/rewards/spendingRules';
  static String kRewardPointsApi = '/V1/rewards/balances/';
  static String kSampleProductStatusApi =
      '/V1/sampleproduct/checkproductstatus';
  static String kRewardsHistoryApi =
      '/V1/rewards/mine/transactions?searchCriteria[sortOrders][0][field]=created_at&searchCriteria[sortOrders][0][direction]=DESC';
}
