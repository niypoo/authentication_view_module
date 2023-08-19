import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class AuthenticatedMiddleware extends GetMiddleware {
  @override
  int get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // get auth state
    final bool? authStatue =
        FirebaseAuthenticationService.to.isAuthenticated.value;

    return (authStatue != null && authStatue)
        ? null
        : RouteSettings(
            name: FirebaseAuthenticationService
                .to.authenticatedRouting.authenticationRouteName,
          );
  }
}
