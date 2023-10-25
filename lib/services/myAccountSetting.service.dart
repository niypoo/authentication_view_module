import 'dart:async';
import 'package:bottom_sheet_helper/services/advanceConformationSheet.helper.dart';
import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:connectivity_service/connectivity.service.dart';
import 'package:dialog_helper/dialogs.helper.dart';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:firebase_authentication_service/models/baseUser.model.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';
import 'package:authentication_view_module/services/toPrememnet.service.dart';
import 'package:authentication_view_module/views/screens/permanent/permanent.screen.dart';
import 'package:get/get.dart';
import 'package:loading_service/loading.service.dart';
import 'package:snackbar_helper/snackbar.service.dart';
import 'package:unicons/unicons.dart';

class MyAccountSettingsService {
  static Future<void> signOut() async {
    try {
      //check  state
      bool status = await ConnectiveService.to.isLiveWithNotification();

      //if offline return null
      if (!status) return;

      final dynamic confirm = await ConformationSheetHelper.show(
        title: 'Confirmation !'.tr,
        subTitle: 'Do you want sign-out'.tr,
      );

      if (confirm == null || (confirm != null && !confirm)) return;

      //switch on
      LoadingService.to.on();

      // get exist user
      final BaseUser? user = FirebaseAuthenticationService.to.user.value;

      // skip
      if (user == null) return;

      if (user.isAnonymous) {
        await FirebaseAuthenticationService.to.destroy();
      } else {
        await FirebaseAuthenticationService.to.signOut();
      }

      //switch on
      LoadingService.to.off();
    } catch (_) {
      LoadingService.to.off();
    }
  }

  static Future<void> deleteMyAccount() async {
    try {
      //check internet first
      bool status = await ConnectiveService.to.isLiveWithNotification();
      //if offline return null
      if (!status) return;

      // confirm user first
      final bool? confirm = await (AdvanceConformationSheetHelper.show(
        title: 'Confirmation !'.tr,
        subTitle: "Delete my account first confirm title".tr,
        icon: UniconsLine.trash,
      ) as FutureOr<bool?>);

      if (confirm != null && confirm) {
        LoadingService.to.on();
        await FirebaseAuthenticationService.to.destroy();
      }
      //switch on
      LoadingService.to.off();
    } catch (_) {
      LoadingService.to.off();
    }
  }

  ///////////////////////////////////
  /////// Permanent Gest Account ///
  /////////////////////////////////
  static Future<void> permanentMyAccount({
    required String title,
    required String subTitle,
  }) async {
    //Get Authentication Type
    Credential? credential = await (CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      child: const PermanentAccountScreen(),
    ) as FutureOr<Credential?>);

    if (credential != null) {
      try {
        LoadingService.to.on();

        //Link Credentials with exist anonymous account
        dynamic state = await AnonymousToPermanentService().change(credential);

        // show message
        if (state != null) {
          SnackbarHelper.show(
            body: 'Anonymous to Permanent success'.tr,
            icon: UniconsLine.user_check,
          );
        }

        // loading off
        LoadingService.to.off();
      } catch (exception) {
        LoadingService.to.off();
        await DialogsHelper.message(
          content: exception.toString(),
        );
      }
    }
  }
}
