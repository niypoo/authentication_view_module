import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:firebase_authentication_service/models/credential.model.dart';

class AnonymousToPermanentService {
  Future<Credential?> change(Credential? credential) async {
    // skip
    if (credential == null) return throw 'Something went wrong';

    //sync anonymous with provider credentials
    final UserCredential fbCredentials = await FirebaseAuthenticationService
        .to.firebaseUser.value!
        .linkWithCredential(credential.providerCredential!);

    // make this user as authenticated
    return Credential(
      provider: credential.provider,
      providerCredential: credential.providerCredential,
      firebaseCredential: fbCredentials,
      displayName: credential.displayName,
    );
  }
}
