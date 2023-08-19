import 'package:authentication_view_module/views/screens/authentication/widgets/authenticationProvidersButtons.widget.dart';
import 'package:authentication_view_module/views/screens/authentication/widgets/welcome.widget.dart';
import 'package:authentication_view_module/views/widgets/policyAndTermsLinks.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';

class AuthenticationLandscapeLayout extends StatelessWidget {
  const AuthenticationLandscapeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyLandscapeView(
      childA: const WelcomeWidget(),
      childB: Column(
        children: const [
          // Buttons Of Authentications
          AuthenticationProvidersButtons(),

          // Policy and terms
          PolicyAndTermsLinksWidget(),
        ],
      ),
    );
  }
}
