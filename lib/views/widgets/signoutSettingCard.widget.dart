import 'package:authentication_view_module/services/myAccountSetting.service.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/cards/settingIconCard.widget.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class SignOutSettingCard extends StatelessWidget {
  const SignOutSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlySettingIconCard(
      title: 'Sign Out'.tr,
      icon: UniconsLine.sign_out_alt,
      onTap: MyAccountSettingsService.signOut,
    );
  }
}

class SignOutDrawerSettingCard extends StatelessWidget {
  const SignOutDrawerSettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyDrawerButton(
      title: 'Sign Out'.tr,
      icon: UniconsLine.sign_out_alt,
      onTap: MyAccountSettingsService.signOut,
    );
  }
}
