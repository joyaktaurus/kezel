import 'package:get_storage/get_storage.dart';
import '../app.dart';



abstract class LocalStore {
  static void setData(String key, dynamic value) =>
      GetStorage().write(key, value);

  static int? getInt(String key) => GetStorage().read(key);

  static String? getString(String key) => GetStorage().read(key);

  static bool? getBool(String key) => GetStorage().read(key);

  static double? getDouble(String key) => GetStorage().read(key);

  static dynamic getData(String key) => GetStorage().read(key);

  static void clearData() async => GetStorage().erase();

  static void setString(String key, String value) =>
      GetStorage().write(key, value);
}

class FetchDataFromLocalStore {
  // userData() async {
  //   App.user = EmployeeDetails(
  //     userId: LocalStore.getString('userId'),
  //     apiToken: LocalStore.getString('apiToken'),
  //     name: LocalStore.getString('name'),
  //     gender: LocalStore.getString('gender'),
  //     dob: LocalStore.getString('dob'),
  //     phone: LocalStore.getString('phone'),
  //     email: LocalStore.getString('email'),
  //     profilePic: LocalStore.getString('profilePic'),
  //   );
  //   App.token = LocalStore.getString('token') ?? '';
  // }

}
