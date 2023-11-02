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
    return const FlyLandscapeView(
      childA: SingleChildScrollView(child: WelcomeWidget()),
      childB: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Buttons Of Authentications
            AuthenticationProvidersButtons(),
      
            // Policy and terms
            PolicyAndTermsLinksWidget(),
          ],
        ),
      ),
    );
  }
}
