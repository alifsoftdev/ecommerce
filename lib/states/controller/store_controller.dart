import 'package:get/get.dart';

import '../model/product_details_model.dart';
import '../model/product_model.dart';
import '../model/sample_product_status_model.dart';
import '../services/store_services.dart';

class StoreController extends GetxController {
  RxBool productListByLoadingFlag = true.obs;
  RxBool brandsListLoadingFlag = true.obs;
  RxBool filterCategoryListLoadingFlag = true.obs;
  RxBool featureProductListLoadingFlag = true.obs;
  RxBool newArrivalProductListLoadingFlag = true.obs;
  RxBool topProductListLoadingFlag = true.obs;
  RxBool filterProductListLoadingFlag = true.obs;
  RxBool productDetailsLoadingFlag = true.obs;
  RxBool isFavoriteLoadingFlag = true.obs;
  RxBool isFeatureFavoriteLoadingFlag = true.obs;
  RxBool isFilterFavoriteLoadingFlag = true.obs;
  RxBool isNewArrivalFavoriteLoadingFlag = true.obs;
  RxBool productFavoriteLoadingFlag = true.obs;
  RxBool productWishListLoadingFlag = true.obs;
  RxBool cartListLoadingFlag = true.obs;
  RxBool addToReviewLoadingFlag = true.obs;
  RxBool storeOrderLoadingFlag = true.obs;
  RxBool sampleProductStatusLoadingFlag = true.obs;

  RxBool recommendedProductsLoadingFlag = true.obs;
  RxBool sameDayDeliveryLoadingFlag = true.obs;
  RxBool trendyItemsLoadingFlag = true.obs;
  RxBool bestSellerLoadingFlag = true.obs;
  RxBool newItemsLoadingFlag = true.obs;

  var counter = RxInt(1);
  double totalAmount = 0.0;

  ProductDetailsModel? productDetails;
  SampleProductStatusResponseModel? statusResponseModel;
  ProductModel? productList;

  ProductModel? recommendedProductList;
  ProductModel? sameDayProductList;
  ProductModel? trendyItemsList;
  ProductModel? newItemsList;
  ProductModel? bestSellerItemsList;

  Rx<List<Item>> productItems = Rx<List<Item>>([]);

  void filterProduct(String productName) {
    List<Item> results = [];
    if (productName.isEmpty) {
      results = productList!.items;
    } else {
      results = productList!.items
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(productName.toLowerCase()))
          .toList();
    }
    productItems.value = results;
  }

  void getProductDetails(var sku) async {
    productDetailsLoadingFlag.value = true;
    try {
      productDetails = await StoreService.getProductDetails(sku);
    } finally {
      productDetailsLoadingFlag.value = false;
      isFavoriteLoadingFlag.value = false;
    }
  }

  void getProductListByFurniture(int id) async {
    productListByLoadingFlag.value = true;
    try {
      productList = await StoreService.getProductsByFur(id);
      if (productList != null) {
        productItems.value = productList!.items;
      }
    } finally {
      productListByLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getSampleProductStatus(
      SampleProductStatusModel sampleProductStatusModel, String token) async {
    sampleProductStatusLoadingFlag.value = true;
    try {
      statusResponseModel = await StoreService.getSampleProductStatus(
          sampleProductStatusModel, token);
    } finally {
      sampleProductStatusLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void increment() {
    counter++;
  }

  void decrease() {
    if (counter != 1) {
      counter--;
    }
  }

  void getBestSellerProductList() async {
    bestSellerLoadingFlag.value = true;
    try {
      bestSellerItemsList = await StoreService.getProductsByFur(259);
    } finally {
      bestSellerLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getRecommendedProductList() async {
    recommendedProductsLoadingFlag.value = true;
    try {
      recommendedProductList = await StoreService.getProductsByFur(257);
    } finally {
      recommendedProductsLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getSameDayProductList() async {
    sameDayDeliveryLoadingFlag.value = true;
    try {
      sameDayProductList = await StoreService.getProductsByFur(260);
    } finally {
      sameDayDeliveryLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getTrendyItemsList() async {
    trendyItemsLoadingFlag.value = true;
    try {
      trendyItemsList = await StoreService.getProductsByFur(258);
    } finally {
      trendyItemsLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getNewItemsList() async {
    newItemsLoadingFlag.value = true;
    try {
      newItemsList = await StoreService.getProductsByFur(78);
    } finally {
      newItemsLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  double totalPrice() {
    // price calculation logic
    return productDetails!.price.toDouble() * counter.toInt();
  }
}
