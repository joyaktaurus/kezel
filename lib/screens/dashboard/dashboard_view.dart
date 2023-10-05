import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kezel/screens/productlist/prod_list_view.dart';

import '../../components/app_dash_cards.dart';
import '../../utils/asset_helper.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';
import 'dashboard_controller.dart';

class DashBoardView extends GetView<DashboardViewController> {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashBoardCards(
                  width: Get.width * 0.9,
                  height: Get.height * .200,
                  text: "Products",
                  onTap: () {
                      Get.to(ProductListView());
                  },
                  // image: AssetHelper.kmdetails,
                ),
                DashBoardCards(
                  width: Get.width * 0.9,
                  height: Get.height * .200,
                  text: "Products",
                  onTap: () {
                    Get.to(ProductListView());
                  },
                  // image: AssetHelper.kmdetails,
                ),
              ],
            ),
          ),
        ])));
  }
}
