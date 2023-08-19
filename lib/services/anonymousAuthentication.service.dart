import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_service/abstracts/firebaseAuthenticationProviderHandler.abstract.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';

class AnonymousAuthenticationService
    implements FirebaseAuthenticationProviderHandler {
  @override
  Future<Credential> credential() async {
    final UserCredential credential =
        await FirebaseAuth.instance.signInAnonymously();

    // //!Proceed has canceled
    // if (credential == null) throw 'Proceed has canceled';

    return Credential(
      provider: AuthenticationProvider.Anonymously,
      firebaseCredential: credential,
      displayName: 'Anonymous-${Random().nextInt(9999)}',
    );
  }

  @override
  Future<Credential> signIn() async => await credential();

  @override
  Future<void> signOut() async {}
}
