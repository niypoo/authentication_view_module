import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Loading
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  Icon
        FlyImage(
          url: AppConfigService.to.appIcon,
          width: 100.sp,
          height: 100.sp,
        ),

        SizedBox(height: 15.sp),

        // Title
        Text(
          'Authentication Screen Title'.tr,
          textAlign: TextAlign.start,
          style: Get.textTheme.headlineMedium!.copyWith(
            fontSize: 16.sp,
          ),
        ),

        // Title
        Text(
          'Authentication Screen Text'.tr,
          textAlign: TextAlign.start,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontSize: 11.sp,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
