import 'package:authentication_view_module/views/screens/authentication/widgets/authenticationProvidersButtons.widget.dart';
import 'package:authentication_view_module/views/screens/authentication/widgets/welcome.widget.dart';
import 'package:authentication_view_module/views/widgets/policyAndTermsLinks.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class AuthenticationPortraitLayout extends StatelessWidget {
  const AuthenticationPortraitLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Loading
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: const WelcomeWidget(),
            ),

            const Spacer(),

            // Buttons Of Authentications
            // Buttons Of Authentications
            const AuthenticationProvidersButtons(),

            // Policy and terms
            const PolicyAndTermsLinksWidget(),
          ],
        ),
      ],
    );
  }
}
