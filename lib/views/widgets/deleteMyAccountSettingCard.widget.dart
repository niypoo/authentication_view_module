import 'package:authentication_view_module/services/myAccountSetting.service.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/cards/settingIconCard.widget.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class DeleteMyAccountSettingCard extends StatelessWidget {
  const DeleteMyAccountSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //DELETE
        FlySettingIconCard(
      title: "Delete My Account".tr,
      subtitle: 'Delete My Account Description'.tr,
      icon: UniconsLine.trash,
      onTap: MyAccountSettingsService.deleteMyAccount,
    );
  }
}

class DeleteMyAccountDrawerSettingCard extends StatelessWidget {
  const DeleteMyAccountDrawerSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //DELETE
        FlyDrawerButton(
      title: "Delete My Account".tr,
      icon: UniconsLine.trash,
      onTap: MyAccountSettingsService.deleteMyAccount,
    );
  }
}
