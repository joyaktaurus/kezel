import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kezel/screens/productlist/pro_list_controller.dart';

import '../../components/app_boxes.dart';
import '../../components/app_empty.dart';
import '../../components/app_load_more.dart';
import '../../components/rounded_loader.dart';
import '../../models/restaurant.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';

class ProductListView extends GetView<ProductListViewController> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductListViewController());
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: Get.height * .120, left: 20),
            child: Text(
              "menu items".toUpperCase(),
              style: MyTheme.regularTextStyle(
                fontWeight: FontWeight.w600,
                color: MyTheme.myBlueDark,
                fontSize: Get.height * .027,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: Get.height * .280),
              child: Obx(() => controller.isScreenProgress.value == true
                  ? Column(
                      children: [
                        Expanded(child: Center(child: RoundedLoader()))
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                      SizedBox(width: Get.width * .03),
                      LoadMore(
                        onLoadMore: controller.loadMore,
                        delegate: DefaultLoadMoreDelegate(),
                        child: controller.productList.isEmpty
                            ? MAResultEmpty(
                                // buttnWidget: Container(),
                                msg: 'Results Empty',
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                ),
                                child: AppBoxes(
                                    child: ListView.builder(
                                  controller:
                                      controller.customersScrollController,
                                  itemCount: controller.productList.length,
                                  itemBuilder: (context, index) {
                                    MenuItems customers =
                                        controller.productList[index];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: Get.height * .025),
                                          Container(
                                              // height: 200,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 3,
                                                    blurRadius: 8,
                                                    offset: Offset(2,
                                                        0), // changes position of shadow
                                                  )
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: Get.width * .20,
                                                            height: Get.height * .20,
                                                            decoration: BoxDecoration(),
                                                            child: customers.products[index].image != null
                                                                ? Image.network(
                                                              customers.products[index].image!,
                                                              fit: BoxFit.cover, // You can set the BoxFit property as needed
                                                            )
                                                                : Image.asset(AssetHelper.foodimage),
                                                          ),

                                                        ],
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * .03),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                bottom: 10,
                                                                left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${customers.products[index].name}',
                                                              style: MyTheme
                                                                  .regularTextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: MyTheme
                                                                    .myBlueDark,
                                                                fontSize:
                                                                    Get.height *
                                                                        .018,
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                              width: 200,
                                                              height: 50,
                                                              child: Text(
                                                                '${customers.products[index].desc}',
                                                                style: MyTheme
                                                                    .regularTextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      Get.height *
                                                                          .013,
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        .01),
                                                            Text(
                                                              '${customers.products[index].amount}',
                                                              style: MyTheme
                                                                  .regularTextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Get.height *
                                                                        .018,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                              ),
                      ),
                    ]))))
        ])));
  }
}
