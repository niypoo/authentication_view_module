import 'package:app_configuration_service/appInfo.config.dart';
import 'package:authentication_view_module/enums/authenticationButtonStyle.enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class AuthenticationButtonWidget extends StatelessWidget {
  const AuthenticationButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonType,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final AuthenticationButtonStyle buttonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.context!.isLandscape ? (context.width / 2) : context.width) *
          0.4,
      margin: EdgeInsets.only(
        bottom: AppConfigService.to.space!.xs,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getButtonColors(buttonType),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConfigService.to.radius,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppConfigService.to.space!.s,
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getButtonIcons(buttonType: buttonType),
            SizedBox(
              width: AppConfigService.to.space!.s,
            ),
            Flexible(
              child: Text(
                text,
                style: buttonType == AuthenticationButtonStyle.AppleDark
                    ? Get.textTheme.titleMedium!
                        .copyWith(color: Get.theme.secondaryHeaderColor)
                    : Get.textTheme.titleMedium,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color? getButtonColors(AuthenticationButtonStyle buttonType) {
  switch (buttonType) {
    case AuthenticationButtonStyle.AppleLight:
      return Colors.white;
    case AuthenticationButtonStyle.AppleDark:
      return Colors.black;
    case AuthenticationButtonStyle.Google:
      return Colors.white;
    case AuthenticationButtonStyle.FaceBook:
      return const Color(0xFF3B5998);
    case AuthenticationButtonStyle.Twitter:
      return const Color(0xFF1DA1F2);
    case AuthenticationButtonStyle.Anonymously:
      return Get.theme.cardColor;
    default:
      return Colors.white;
  }
}

Widget getButtonIcons({
  AuthenticationButtonStyle? buttonType,
  double size = 20.0,
}) {
  switch (buttonType) {
    case AuthenticationButtonStyle.AppleLight:
      return Icon(
        UniconsLine.apple,
        size: size,
        color: Get.theme.iconTheme.color,
      );
    case AuthenticationButtonStyle.AppleDark:
      return Icon(
        UniconsLine.apple,
        size: size,
        color: Get.theme.secondaryHeaderColor,
      );
    case AuthenticationButtonStyle.Google:
      return Image.asset('assets/images/google_light.png',width: size,height: size,);
    case AuthenticationButtonStyle.FaceBook:
      return Icon(
        UniconsLine.facebook,
        size: size,
        color: Get.theme.iconTheme.color,
      );
    case AuthenticationButtonStyle.Twitter:
      return Icon(
        UniconsLine.twitter,
        size: size,
        color: Get.theme.iconTheme.color,
      );
    case AuthenticationButtonStyle.Anonymously:
      return Icon(
        UniconsLine.user_exclamation,
        size: size,
        color: Get.theme.iconTheme.color,
      );
    default:
      return const SizedBox.shrink();
  }
}
