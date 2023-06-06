import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/image_search_model.dart';
import '../repository/home_repository.dart';


class HomeControllerGraphql extends GetxController {
  final HomeRepository homeRepository = Get.put(HomeRepository());

  RxBool imageSearchLoadingFlag = true.obs;

  Rx<List<PhotoSearchItem>> photoSearchProductItems = Rx<List<PhotoSearchItem>>([]);
  ImageSearchModel? imageSearchModel;

  void filterProduct(String productName) {
    List<PhotoSearchItem> results = [];
    if (productName.isEmpty) {
      results = imageSearchModel!.productsearchbyimage.items;
    } else {
      results = imageSearchModel!.productsearchbyimage.items
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(productName.toLowerCase()))
          .toList();
    }
    photoSearchProductItems.value = results;
  }

  Future<void> getImageSearchData(String image) async {
    if (kDebugMode) {
      print('Loading');
    }
    imageSearchLoadingFlag.value = true;

    var response =
    await homeRepository.getImageSearchData(image);

    if (kDebugMode) {
      print('responseImg: $response');
    }

    if (response != null) {
      imageSearchModel = response;
      if(imageSearchModel !=null){
        photoSearchProductItems.value = imageSearchModel!.productsearchbyimage.items;
      }

      imageSearchLoadingFlag.value = false;
    } else {
      if (kDebugMode) {
        print("empty data!");
      }
    }
  }


}