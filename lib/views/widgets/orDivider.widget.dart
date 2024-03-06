import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: SizedBox(
        width: context.width * (context.isLandscape ? 0.25 : 0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Divider(),
                ),
                SizedBox(width: AppConfigService.to.space!.s),
                const Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  "Or".tr,
                  style: Get.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
