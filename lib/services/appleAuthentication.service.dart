import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_service/abstracts/firebaseAuthenticationProviderHandler.abstract.dart';
import 'package:firebase_authentication_service/enums/authenticationProvider.enum.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthenticationService
    implements FirebaseAuthenticationProviderHandler {
  @override
  Future<Credential> credential() async {
    // check is app support apple authentication
    if (!await SignInWithApple.isAvailable()) {
      throw 'Apple SignIn is not available for your device';
    }

    // trigger credentials
    final AuthorizationCredentialAppleID credential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    CredentialState credentialState =
        await SignInWithApple.getCredentialState(credential.userIdentifier!);

    //check apple account status
    switch (credentialState) {
      //IF status is Authorized
      case CredentialState.authorized:

        // generate OauthProvider
        OAuthProvider oAuthProvider = OAuthProvider("apple.com");

        //convert auth data to string
        String? idToken = credential.identityToken;
        String accessToken = credential.authorizationCode;

        ///get Credentials
        final AuthCredential appleCredential = oAuthProvider.credential(
          idToken: idToken,
          accessToken: accessToken,
        );

        // payload
        return Credential(
          provider: AuthenticationProvider.Apple,
          displayName: '${credential.givenName} ${credential.familyName}',
          providerCredential: appleCredential,
        );
      case CredentialState.revoked:
        return throw 'Proceed has canceled';
      default:
        return throw 'Something went wrong';
    }
  }

  @override
  Future<Credential> signIn() async {
    ///get Credentials
    final Credential appleCredential = await credential();

    // firebase credentials
    final UserCredential firebaseCredential = await FirebaseAuth.instance
        .signInWithCredential(appleCredential.providerCredential!);

    // Provider Credentials
    return Credential(
      provider: appleCredential.provider,
      providerCredential: appleCredential.providerCredential,
      firebaseCredential: firebaseCredential,
      displayName: appleCredential.displayName,
    );
  }

  @override
  Future<void> signOut() async {}
}
