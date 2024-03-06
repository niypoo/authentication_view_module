import 'package:app_configuration_service/appInfo.config.dart';
import 'package:authentication_view_module/enums/authenticationButtonStyle.enum.dart';
import 'package:authentication_view_module/views/screens/authentication/authenticationScreen.controller.dart';
import 'package:authentication_view_module/views/widgets/authenticationButton.widget.dart';
import 'package:authentication_view_module/views/widgets/orDivider.widget.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

import 'package:get/get.dart';

class AuthenticationProvidersButtons
    extends GetView<AuthenticationScreenController> {
  const AuthenticationProvidersButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConfigService.to.space!.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // hint
          Padding(
            padding: EdgeInsets.only(bottom: 15.sp),
            child: Text(
              'You can access all services with one click, press any button below to log in.'
                  .tr,
              style: Get.textTheme.labelSmall,
            ),
          ),
          //##  IOS Button Dark ## //
          if (GetPlatform.isIOS && AppConfigService.to.authenticationWithApple)
            AuthenticationButtonWidget(
              text: "Sign in with Apple".tr,
              buttonType: Get.isDarkMode
                  ? AuthenticationButtonStyle.AppleLight
                  : AuthenticationButtonStyle.AppleDark,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Apple),
            ),

          //## Google Button ##//
          if (AppConfigService.to.authenticationWithGoogle)
            AuthenticationButtonWidget(
              text: "Sign in with Google".tr,
              buttonType: AuthenticationButtonStyle.Google,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Google),
            ),

          //## Facebook Button ##//
          if (AppConfigService.to.authenticationWithFacebook)
            AuthenticationButtonWidget(
              text: "Sign in with Facebook".tr,
              buttonType: AuthenticationButtonStyle.FaceBook,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Facebook),
            ),
          //## Twitter Button ##//
          if (AppConfigService.to.authenticationWithTwitter)
            AuthenticationButtonWidget(
              text: "Sign in with Twitter".tr,
              buttonType: AuthenticationButtonStyle.Twitter,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Twitter),
            ),
          //## Linkedin Button ##//
          if (AppConfigService.to.authenticationWithLinkedin)
            AuthenticationButtonWidget(
              text: "Sign in with Linkedin".tr,
              buttonType: AuthenticationButtonStyle.Linkedin,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Linkedin),
            ),
          //## Github Button ##//
          if (AppConfigService.to.authenticationWithGithub)
            AuthenticationButtonWidget(
              text: "Sign in with Github".tr,
              buttonType: AuthenticationButtonStyle.Github,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Github),
            ),

          const OrDivider(),

          // ## Gest Button ##//
          if (AppConfigService.to.authenticationAsAnonymously)
            AuthenticationButtonWidget(
              text: "Sign in as Guest".tr,
              buttonType: AuthenticationButtonStyle.Anonymously,
              onPressed: () async =>
                  controller.signIn(AuthenticationProvider.Anonymously),
            ),
        ],
      ),
    );
  }
}
