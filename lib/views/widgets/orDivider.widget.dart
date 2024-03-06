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
            const Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              width: 25.sp,
              height: 25.sp,
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
