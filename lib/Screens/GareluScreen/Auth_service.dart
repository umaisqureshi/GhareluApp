import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificatiCode;

  verifyPhone(String number) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: '+92${number}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {}
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          verificatiCode = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificatiCode = verificationId;
        },
        timeout: Duration(seconds: 60));
  }
}
