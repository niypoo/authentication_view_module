import 'package:authentication_view_module/views/screens/authentication/authenticationScreen.controller.dart';
import 'package:get/get.dart';

class AuthenticationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationScreenController>(
        () => AuthenticationScreenController());
  }
}
