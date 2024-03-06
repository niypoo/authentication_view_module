import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_url_helper/launchURL.service.dart';

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
                style: Get.textTheme.bodySmall,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(AppConfigService.to.space!.m),
              onTap: () => LaunchUrlHelper.toUrl(AppConfigService.to.termsUrl),
              child: Text(
                ' ${'Terms'.tr}',
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              ' ${"and".tr} ',
              style: Get.textTheme.bodySmall,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(AppConfigService.to.space!.m),
              onTap: () =>
                  LaunchUrlHelper.toUrl(AppConfigService.to.privacyUrl),
              child: Text(
                "Privacy Policy".tr,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
