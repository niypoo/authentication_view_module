import 'package:authentication_view_module/views/screens/authentication/widgets/authenticationProvidersButtons.widget.dart';
import 'package:authentication_view_module/views/screens/authentication/widgets/welcome.widget.dart';
import 'package:authentication_view_module/views/widgets/policyAndTermsLinks.widget.dart';
import 'package:flutter/material.dart';

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
          children: const [
            Spacer(),

            // Loading
            WelcomeWidget(),

            Spacer(),

            // Buttons Of Authentications
            // Buttons Of Authentications
            AuthenticationProvidersButtons(),

            // Policy and terms
            PolicyAndTermsLinksWidget(),
          ],
        ),
      ],
    );
  }
}
