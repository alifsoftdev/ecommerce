import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;
import '../../constants/strings.dart';
import '../../view/ui/screens/home/home.dart';
import '../model/banner_model.dart';
import '../model/banner_response_model.dart';
import '../model/category_details_response_model.dart';
import '../model/category_list.dart';
import '../model/category_model.dart';
import '../model/category_response_model.dart';
import '../model/privacy_model.dart';
import '../model/product_model.dart';
import '../model/search_model.dart';
import '../services/home_services.dart';
import '../utils/methods.dart';

class HomeController extends GetxController {
  RxBool searchProductLoading = true.obs;
  RxBool pListLoading = true.obs;
  RxBool pCategoryListLoading = true.obs;
  RxBool brandsListLoadingFlag = true.obs;
  RxBool privacyLoadingFlag = true.obs;
  RxBool productByCategoryLoadingFlag = true.obs;
  RxBool contactUsLoadingFlag = true.obs;
  RxBool bannerListLoading = true.obs;
  RxBool categoriesListLoadingFlag = true.obs;
  RxBool pCategoryDetailsLoading = true.obs;
  RxBool departmentListLoadingFlag = true.obs;

  SearchModel? searchModel;
  ProductModel? productList;
  PrivacyModel? privacyModel;
  ProductModel? homeProductList;
  String? contactUsResponse;
  BannerResponseModel? bannerList;
  List<BannerModel>? bannerModelList;
  List<CategoryModel>? categoryModelList;
  List<CategoryModel>? departmentModelList;
  Rx<List<SearchItem>> searchProductItems = Rx<List<SearchItem>>([]);
  Rx<List<Item>> searchItems = Rx<List<Item>>([]);

  CategoryResponseModel? categoryResponseModel;
  CategoryDetailsResponseModel? categoryDetailsResponseModel;
  CategoryResponseModel? departmentResponseModel;

  List<CategoryListModel> categoryList = <CategoryListModel>[].obs;
  List<String> images = [];
  List<String> categoryIDList = [];
  List<String> categoryImageList = [];
  List<String> categoryItemIDList = [];
  List<String> categoryNameList = [];

  List<String> departmentImageList = [];
  List<String> departmentIDList = [];
  List<String> departmentNameList = [];

  void filterProduct(String productName) {
    List<SearchItem> results = [];
    if (productName.isEmpty) {
      results = searchModel!.items;
    } else {
      results = searchModel!.items
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(productName.toLowerCase()))
          .toList();
    }
    searchProductItems.value = results;
  }

  void filterProductBS(String productName) {
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
    searchItems.value = results;
  }

  void searchProduct({required String queryText}) async {
    searchProductLoading.value = true;
    try {
      var response = await HomeService.searchProduct(queryText: queryText);
      searchModel = searchModelFromJson(response);

      if (searchModel != null) {
        searchProductItems.value = searchModel!.items;
      }
    } finally {
      searchProductLoading.value = false;
    }
  }

  void getProductList(bool homeFlag) async {
    // _parseData("");
    pListLoading.value = true;
    try {
      var response = await HomeService.getProducts();
      if (response != null) {
        ProductModel obj = productModelFromJson(response.toString());
        if (homeFlag) {
          homeProductList = obj;
        } else {
          productList = obj;
        }
      }
    } finally {
      pListLoading.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getProductCategoryListByID(String adminToken, int categoryID) async {
    pCategoryListLoading.value = true;
    try {
      categoryList =
          await HomeService.getProductCategoryList(adminToken, categoryID);
    } finally {
      pCategoryListLoading.value = false;
    }
  }

  void getCategoryDetailsByID(String adminToken, int categoryID) async {
    pCategoryDetailsLoading.value = true;
    try {
      var response =
          await HomeService.getCategoryDetails(adminToken, categoryID);

      if (response != null) {
        categoryDetailsResponseModel =
            categoryDetailsResponseModelFromJson(response.toString());
      }
    } finally {
      pCategoryDetailsLoading.value = false;
    }
  }

  void getPrivacyPolicy() async {
    privacyLoadingFlag.value = true;
    try {
      privacyModel = await HomeService.getPrivacyPolicy();
    } finally {
      privacyLoadingFlag.value = false;
    }
  }

  void getProductsByCategoryId(String id) async {
    productByCategoryLoadingFlag.value = true;
    try {
      var response = await HomeService.getProductsByCategoryId(id);
      if (response != null) {
        ProductModel obj = productModelFromJson(response.toString());
        productList = obj;
        searchItems.value = productList!.items;
      }
    } finally {
      productByCategoryLoadingFlag.value = false;
    }
  }

  void postContactUsApi(String name, String email, String reason, String phone,
      String message) async {
    Methods.showLoading();
    contactUsLoadingFlag.value = true;
    try {
      var response =
          await HomeService.contactUsApi(name, email, reason, phone, message);
      contactUsResponse = response.toString();
      Get.offNamed(HomeScreen.routeName);
    } finally {
      contactUsLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }

  void getBannerList() async {
    bannerListLoading.value = true;
    try {
      var response = await HomeService.getBannerList();
      if (response != null) {
        BannerResponseModel obj =
            bannerResponseModelFromJson(response.toString());

        bannerList = obj;

        String result = bannerList!.content.replaceAll("\n", "");
        var document = parse(result);
        var imgList = document.querySelectorAll("img");

        for (dom.Element img in imgList) {
          // print(img.attributes["data-src"]);
          images.add(img.attributes["src"]!);
          categoryIDList.add(img.attributes["data-link"]!);
        }
        bannerModelList = <BannerModel>[];

        for (int i = 0; i < images.length; i++) {
          print("0000 ${images[i]}");
          print("1111 ${categoryIDList[i]}");

          const start = "url='";
          const end = "'}";

          final startIndex = images[i].indexOf(start);
          final endIndex = images[i].indexOf(end, startIndex + start.length);
          String imageUrl = ConstantStrings.kBannerUrl +
              images[i].substring(startIndex + start.length, endIndex);
          print("imageUrl ${ConstantStrings.kBannerUrl + imageUrl}");
          BannerModel bannerModel =
              BannerModel(id: categoryIDList[i], imageUrl: imageUrl);
          bannerModelList!.add(bannerModel);
        }
      }
    } finally {
      bannerListLoading.value = false;
    }
  }

  void getCategoriesList() async {
    categoriesListLoadingFlag.value = true;
    try {
      var response = await HomeService.getCategoriesList();
      if (response != null) {
        CategoryResponseModel obj =
            categoryResponseModelFromJson(response.toString());

        categoryResponseModel = obj;

        String result = categoryResponseModel!.content.replaceAll("\n", "");
        var document = parse(result);

        var imageList = document.querySelectorAll("img");

        for (dom.Element img in imageList) {
          categoryImageList.add(img.attributes["src"]!);
          categoryItemIDList.add(img.attributes["data-link"]!);
          categoryNameList.add(img.attributes["data-label"]!);
        }
        categoryModelList = <CategoryModel>[];

        for (int i = 0; i < categoryImageList.length; i++) {
          print("0000 ${categoryImageList[i]}");
          print("1111 ${categoryItemIDList[i]}");
          print("2222 ${categoryNameList[i]}");

          const start = "url='";
          const end = "'}";

          final startIndex = categoryImageList[i].indexOf(start);
          final endIndex =
              categoryImageList[i].indexOf(end, startIndex + start.length);
          String imageUrl = ConstantStrings.kBannerUrl +
              categoryImageList[i]
                  .substring(startIndex + start.length, endIndex);
          print("imageUrl ${ConstantStrings.kBannerUrl + imageUrl}");
          CategoryModel categoryModel = CategoryModel(
              id: categoryItemIDList[i],
              imageUrl: imageUrl,
              name: categoryNameList[i]);
          categoryModelList!.add(categoryModel);
        }
      }
    } finally {
      categoriesListLoadingFlag.value = false;
    }
  }

  void getDepartmentList() async {
    departmentListLoadingFlag.value = true;
    try {
      var response = await HomeService.getDepartmentList();
      if (response != null) {
        CategoryResponseModel obj =
            categoryResponseModelFromJson(response.toString());

        departmentResponseModel = obj;

        String result = departmentResponseModel!.content.replaceAll("\n", "");
        var document = parse(result);

        var imageList = document.querySelectorAll("img");

        for (dom.Element img in imageList) {
          departmentImageList.add(img.attributes["src"]!);
          departmentIDList.add(img.attributes["data-link"]!);
          departmentNameList.add(img.attributes["data-label"]!);
        }
        departmentModelList = <CategoryModel>[];

        for (int i = 0; i < departmentImageList.length; i++) {
          print("0000 ${departmentImageList[i]}");
          print("1111 ${departmentIDList[i]}");
          print("2222 ${departmentNameList[i]}");

          const start = "url='";
          const end = "'}";

          final startIndex = departmentImageList[i].indexOf(start);
          final endIndex =
              departmentImageList[i].indexOf(end, startIndex + start.length);
          String imageUrl = ConstantStrings.kBannerUrl +
              departmentImageList[i]
                  .substring(startIndex + start.length, endIndex);
          if (kDebugMode) {
            print("imageUrl ${ConstantStrings.kBannerUrl + imageUrl}");
          }
          CategoryModel categoryModel = CategoryModel(
              id: departmentIDList[i],
              imageUrl: imageUrl,
              name: departmentNameList[i]);
          departmentModelList!.add(categoryModel);
        }
      }
    } finally {
      departmentListLoadingFlag.value = false;
    }
  }
}
