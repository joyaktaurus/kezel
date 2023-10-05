import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kezel/routes.dart';

import 'app.dart';
import 'my_theme.dart';

void main() async{
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appTitle,
      theme: ThemeData(
        primarySwatch: MyTheme.primaryColor1,
        unselectedWidgetColor: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    ),
  );
}