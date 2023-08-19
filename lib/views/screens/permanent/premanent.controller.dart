import 'package:connectivity_service/connectivity.service.dart';
import 'package:authentication_view_module/services/appleAuthentication.service.dart';
import 'package:authentication_view_module/services/googleAuthentication.service.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';
import 'package:get/get.dart';
import 'package:loading_service/loading.service.dart';

class PermanentScreenController extends GetxController {
  static PermanentScreenController get to => Get.find();

  /// handle authentication types when user tap on a social buttons
  Future<Credential?> link(AuthenticationProvider provider) async {
    try {
      //check internet connection first
      bool networkState = await ConnectiveService.to.isLiveWithNotification();

      //if internet on
      if (!networkState) return null;

      Credential? credential;

      switch (provider) {
        case AuthenticationProvider.Apple:
          // loading
          LoadingService.to.on();
          credential = await AppleAuthenticationService().credential();
          break;
        case AuthenticationProvider.Google:
          // loading
          LoadingService.to.off();
          credential = await GoogleAuthenticationService().credential();
          break;
        default:
      }

      // loading
      LoadingService.to.off();

      // return back with credential=
      Get.back(result: credential);
    } catch (e) {
      // loading
      LoadingService.to.off();
      return null;
    }
    return null;
  }
}
