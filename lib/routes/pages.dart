import 'package:authentication_view_module/routes/routes.dart';
import 'package:authentication_view_module/views/screens/authentication/authentication.screen.dart';
import 'package:authentication_view_module/views/screens/authentication/authenticationScreen.binding.dart';
import 'package:fly_ui/transitions/flyRouteTransition.dart';
import 'package:get/get.dart';

class AuthenticationsPages {
  static final routes = [
    GetPage(
      name: AuthenticationsRoutesNames.AUTHENTICATION,
      page: () => const AuthenticationScreen(),
      binding: AuthenticationScreenBinding(),
      customTransition: FlySharedAxisTransition(),
    ),
  ];
}
