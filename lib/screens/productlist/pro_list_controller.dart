import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/restaurant.dart';
import '../../services/restaurant services.dart';
import '../../utils/my_utils.dart';
import '../../utils/mydio.dart';

class ProductListViewController extends GetxController {
  RxList<MenuItems> productList = (List<MenuItems>.of([])).obs;
  final box = GetStorage();
  RxBool isScreenProgress = false.obs;
  RxInt productsTotalCount = 0.obs;
  final ScrollController customersScrollController = ScrollController();
  Future<bool> loadMore() async {
    log("onLoadMore");
    return true;
  }
  @override
  void onInit() async {
    super.onInit();
    customersScrollController.addListener(_scrollListener);
    fetchProductDetails();
    isScreenProgress.value = true;
    await initialProductsList();
    isScreenProgress.value = false;
  }
  Future<void> fetchProductDetails() async {
    try {
      final Map<String, dynamic> apiParameters = {
        'key': 'restaurant',
        'value': 'LeisureInnVKL',
      };
      final response = await MyDio().Post(
        '/getAllDigitalMenu.php',
        queryParameters: apiParameters,
      );
      print('API Response: $response');

      if (response != null && response.containsKey("menu_items")) {
        Restaurant restaurant = Restaurant.fromJson(response);
        List<MenuItems> menuItems = restaurant.menuItems;
        productList.assignAll(menuItems);
      } else {
        print('API response is null or missing "menu_items"');
      }
    } catch (e) {
      print('Error while fetching shop details: $e');
    }
  }



  void _scrollListener() {
    if (customersScrollController.offset >=
        customersScrollController.position.maxScrollExtent &&
        !customersScrollController.position.outOfRange) {
      log("reach the bottom");

      if (productList.length == productsTotalCount.value) {
        log("all items loaded");
      }
    }
    if (customersScrollController.offset <=
        customersScrollController.position.minScrollExtent &&
        !customersScrollController.position.outOfRange) {
      log("reach the top");
    }
  }
  initialProductsList() async {
    //Map body = customersListApiPayload;
    ApiResp resp = await RestaurantServices.fetchMarketing(
      url: 'https://kezel.co/api/getAllDigitalMenu.php',
      parameters: {
        'key': 'restaurant',
        'value': 'LeisureInnVKL',
      },
      method: 'POST',
    );
    productList.value = Restaurant.fromJson(resp.rdata).menuItems.toList();
    App.shopdetatils=productList.value;
    print(App.shopdetatils.first.name);
    return productList;
  }
}
