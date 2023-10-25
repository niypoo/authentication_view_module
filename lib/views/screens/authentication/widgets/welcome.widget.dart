import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';

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
        Padding(
          padding: EdgeInsets.all(AppConfigService.to.space!.m),
          child: FlyImage(
            url: AppConfigService.to.appIcon,
            width: 200,
            height: 200,
          ),
        ),

        // Title
        Text(
          'Authentication Screen Title'.tr,
          textAlign: TextAlign.start,
          style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.secondaryHeaderColor),
        ),

        // Title
        Text(
          'Authentication Screen Text'.tr,
          textAlign: TextAlign.start,
          style: Get.textTheme.bodyMedium!.copyWith(color: Get.theme.secondaryHeaderColor),
        ),
      ],
    );
  }
}
