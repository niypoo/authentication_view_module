import 'package:authentication_view_module/services/myAccountSetting.service.dart';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/cards/settingIconCard.widget.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class ChangeToPermanentSettingCard
    extends GetView<FirebaseAuthenticationService> {
  const ChangeToPermanentSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.user.value != null && controller.user.value!.isAnonymous
          ? FlySettingIconCard(
              title: 'Convert To Permanent'.tr,
              subtitle: "Permanent Hint".tr,
              icon: Icons.arrow_forward_ios_rounded,
              onTap: () async {
                MyAccountSettingsService.permanentMyAccount(
                  title: 'Account Permanent'.tr,
                  subTitle:
                      'Change your guest account to membership permanent to avoid lost any data.'
                          .tr,
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}

class ChangeToPermanentDrawerSettingCard
    extends GetView<FirebaseAuthenticationService> {
  const ChangeToPermanentDrawerSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.user.value != null && controller.user.value!.isAnonymous
          ? FlyDrawerButton(
              title: 'Convert To Permanent'.tr,
              icon: UniconsLine.user_check,
              onTap: () async {
                MyAccountSettingsService.permanentMyAccount(
                  title: 'Account Permanent'.tr,
                  subTitle:
                      'Change your guest account to membership permanent to avoid lost any data.'
                          .tr,
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
