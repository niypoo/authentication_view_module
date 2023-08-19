import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    this.color,
    this.height,
  }) : super(key: key);

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height ?? AppConfigService.to.space!.xs),
      child: SizedBox(
        width: context.width * (context.isLandscape ? 0.25 : 0.5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: color ?? Get.textTheme.subtitle2!.color,
                  ),
                ),
                SizedBox(width: AppConfigService.to.space!.s),
                Expanded(
                  child: Divider(
                    color: color ?? Get.textTheme.subtitle2!.color,
                  ),
                ),
              ],
            ),
            Container(
              color: Get.theme.scaffoldBackgroundColor,
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  "Or".tr,
                  style: Get.textTheme.subtitle2!.copyWith(color: color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
