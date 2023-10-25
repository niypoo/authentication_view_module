import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConfigService.to.space!.xs),
      child: SizedBox(
        width: context.width * (context.isLandscape ? 0.25 : 0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(color: Get.theme.secondaryHeaderColor),
                ),
                SizedBox(width: AppConfigService.to.space!.s),
                Expanded(
                  child: Divider(color: Get.theme.secondaryHeaderColor),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Get.theme.secondaryHeaderColor)),
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  "Or".tr,
                  style: Get.textTheme.titleLarge!
                      .copyWith(color: Get.theme.secondaryHeaderColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
