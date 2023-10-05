import 'package:get/get.dart';
import 'package:kezel/screens/dashboard/dashboard_binding.dart';
import 'package:kezel/screens/dashboard/dashboard_view.dart';
import 'package:kezel/screens/productlist/pro_list_binding.dart';
import 'package:kezel/screens/productlist/prod_list_view.dart';
import 'package:kezel/screens/splashscreen.dart';


class Routes {
  static const splash = '/';
  static const dashBoardPage = '/dashboardpage';
  static const productlistPage = '/productlistpage';


  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: DashboardViewBindings(),
      name: dashBoardPage,
      page: () =>  DashBoardView(),
    ),
    GetPage(
      binding: ProductListViewBindings(),
      name: productlistPage,
      page: () =>  ProductListView(),
    ),



  ];
}
