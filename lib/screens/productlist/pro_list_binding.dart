import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:kezel/screens/productlist/pro_list_controller.dart';



class ProductListViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListViewController>(
          () => ProductListViewController(),
    );
  }
}
