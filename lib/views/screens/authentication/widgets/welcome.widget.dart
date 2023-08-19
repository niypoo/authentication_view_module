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
      children: [
        //  Icon
        Padding(
          padding: EdgeInsets.all(AppConfigService.to.space!.m),
          child: FlyImage(
            url: AppConfigService.to.appIcon,
            width: 100,
            height: 100,
          ),
        ),

        // Title
        Text(
          'Authentication Screen Title'.tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.titleLarge,
        ),

        // Title
        Text(
          'Authentication Screen Text'.tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
