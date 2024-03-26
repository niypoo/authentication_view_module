import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:connectivity_service/connectivity.service.dart';
import 'package:authentication_view_module/services/anonymousAuthentication.service.dart';
import 'package:authentication_view_module/services/appleAuthentication.service.dart';
import 'package:authentication_view_module/services/googleAuthentication.service.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';
import 'package:get/get.dart';
import 'package:loading_service/loading.service.dart';
import 'package:unicons/unicons.dart';

class AuthenticationScreenController extends GetxController {
  // define
  static AuthenticationScreenController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// handle authentication types when user tap on a social butns
  Future<Credential?> signIn(AuthenticationProvider provider) async {
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
          credential = await AppleAuthenticationService().signIn();
          LoadingService.to.off();
          break;
        case AuthenticationProvider.Google:
          // loading
          LoadingService.to.on();
          credential = await GoogleAuthenticationService().signIn();
          print('[[[[[[credential]]]]]] ${credential}');
          LoadingService.to.off();
          break;
        case AuthenticationProvider.Anonymously:

          // show alert guest
          final dynamic confirmation = await ConformationSheetHelper.show(
            title: "Warning".tr,
            subTitle: "Guest Warning".tr,
            icon: UniconsLine.user_exclamation,
          );

          if (confirmation != null && confirmation) {
            // loading
            LoadingService.to.on();
            credential = await AnonymousAuthenticationService().signIn();
            LoadingService.to.off();
          }

          break;
        default:
      }

      // return back with credential=
      return credential;
    } catch (e) {
      print('[[[[[[credential error !!]]]]]] ${e}');
      // loading
      LoadingService.to.off();
      return null;
    }
  }
}
