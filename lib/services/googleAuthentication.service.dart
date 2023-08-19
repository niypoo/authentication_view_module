import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_service/abstracts/firebaseAuthenticationProviderHandler.abstract.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticationService
    implements FirebaseAuthenticationProviderHandler {
  @override
  Future<Credential> credential() async {
    try {
      // google auth pop-up and attempt user to authenticated
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

      //!Proceed has canceled
      if (googleAccount == null) throw 'Proceed has canceled';

      // google credentials
      final GoogleSignInAuthentication googleAccountAuthentication =
          await googleAccount.authentication;

      // provider credentials
      final AuthCredential providerCredential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken,
      );

      // Provider Credentials
      return Credential(
        provider: AuthenticationProvider.Google,
        providerCredential: providerCredential,
      );
    } on FirebaseAuthException catch (exception) {
      throw exception.code;
    }
  }

  @override
  Future<Credential> signIn() async {
    try {
      // provider credentials
      final Credential googleCredential = await credential();

      // firebase credentials
      final UserCredential firebaseCredential = await FirebaseAuth.instance
          .signInWithCredential(googleCredential.providerCredential!);

      // Provider Credentials
      return Credential(
        provider: googleCredential.provider,
        providerCredential: googleCredential.providerCredential,
        firebaseCredential: firebaseCredential,
        displayName: firebaseCredential.user!.displayName,
      );
    } on FirebaseAuthException catch (exception) {
      throw exception.code;
    }
  }

  @override
  Future<void> signOut() async => await GoogleSignIn().signOut();
}
