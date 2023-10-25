import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyAndTermsLinksWidget extends StatelessWidget {
  const PolicyAndTermsLinksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: AppConfigService.to.space!.l),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Text(
                "By using you agree on".tr,
                style: Get.textTheme.bodySmall!.copyWith(color: Get.theme.secondaryHeaderColor),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(AppConfigService.to.space!.m),
              // onTap: () => LaunchUrl.open(Config.termsUrl(
              //     LocalesController.to.currentLocale.languageCode)),
              child: Text(
                ' ${'Terms'.tr}',
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
            ),
            Text(
              ' ${"and".tr} ',
              style: Get.textTheme.bodySmall!.copyWith(color: Get.theme.secondaryHeaderColor),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(AppConfigService.to.space!.m),
              // onTap: () => LaunchUrl.open(Config.privacyUrl(
              //     LocalesController.to.currentLocale.languageCode)),
              child: Text(
                "Privacy Policy".tr,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
