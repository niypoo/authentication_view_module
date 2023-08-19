import 'package:app_configuration_service/appInfo.config.dart';
import 'package:authentication_view_module/enums/authenticationButtonStyle.enum.dart';
import 'package:authentication_view_module/views/screens/permanent/premanent.controller.dart';
import 'package:authentication_view_module/views/widgets/authenticationButton.widget.dart';
import 'package:authentication_view_module/views/widgets/policyAndTermsLinks.widget.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermanentAccountScreen extends GetView<PermanentScreenController> {
  const PermanentAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<PermanentScreenController>(PermanentScreenController());

    // to avoid sign-in in account and field to link with anonymous account !!
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //##  IOS Button Dark ## //
          if (GetPlatform.isIOS && AppConfigService.to.authenticationWithApple)
            AuthenticationButtonWidget(
              text: "Sign in with Apple".tr,
              buttonType: Get.isDarkMode
                  ? AuthenticationButtonStyle.AppleLight
                  : AuthenticationButtonStyle.AppleDark,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Apple),
            ),

          //## Google Button ##//
          if (AppConfigService.to.authenticationWithGoogle)
            AuthenticationButtonWidget(
              text: "Sign in with Google".tr,
              buttonType: AuthenticationButtonStyle.Google,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Google),
            ),

          //## Facebook Button ##//
          if (AppConfigService.to.authenticationWithFacebook)
            AuthenticationButtonWidget(
              text: "Sign in with Facebook".tr,
              buttonType: AuthenticationButtonStyle.FaceBook,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Facebook),
            ),
          //## Twitter Button ##//
          if (AppConfigService.to.authenticationWithTwitter)
            AuthenticationButtonWidget(
              text: "Sign in with Twitter".tr,
              buttonType: AuthenticationButtonStyle.Twitter,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Twitter),
            ),
          //## Linkedin Button ##//
          if (AppConfigService.to.authenticationWithLinkedin)
            AuthenticationButtonWidget(
              text: "Sign in with Linkedin".tr,
              buttonType: AuthenticationButtonStyle.Linkedin,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Linkedin),
            ),
          //## Github Button ##//
          if (AppConfigService.to.authenticationWithGithub)
            AuthenticationButtonWidget(
              text: "Sign in with Github".tr,
              buttonType: AuthenticationButtonStyle.Github,
              onPressed: () async =>
                  controller.link(AuthenticationProvider.Github),
            ),

          // FOOTER [ POLICY & TERMS]
          // Policy and terms
          const PolicyAndTermsLinksWidget(),
        ],
      ),
    );
  }
}
