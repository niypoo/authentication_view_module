import 'package:authentication_view_module/views/screens/authentication/layouts/landscape.view.dart';
import 'package:authentication_view_module/views/screens/authentication/layouts/portrait.view.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/layouts/scaffoldPadding.widget.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyScaffold(
      backgroundColor: Get.theme.primaryColor,
      child: FlyScaffoldPadding(
        // landscape & portrait view
        child: context.isLandscape
            ? const AuthenticationLandscapeLayout()
            : const AuthenticationPortraitLayout(),
      ),
    );
  }
}
