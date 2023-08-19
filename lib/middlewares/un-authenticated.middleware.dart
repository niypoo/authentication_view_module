import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class UnAuthenticatedMiddleware extends GetMiddleware {
  @override
  int get priority => 1;
  // get auth state
  final bool? authStatue =
      FirebaseAuthenticationService.to.isAuthenticated.value;

  @override
  RouteSettings? redirect(String? route) {
    return !(authStatue!)
        ? null
        : RouteSettings(
            name: FirebaseAuthenticationService
                .to.authenticatedRouting.authenticationRouteName);
  }
}
