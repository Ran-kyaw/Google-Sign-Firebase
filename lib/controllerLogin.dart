import 'package:flutter/material.dart';
import 'package:google_sign/googleUserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin with ChangeNotifier {
  var googleSignNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  GoogleUser? googleUser;

  //ForLogin
  allowUserToLogin() async {
    googleSignInAccount = await googleSignNow.signIn();
    googleUser = GoogleUser(
        displayName: googleSignInAccount!.displayName,
        email: googleSignInAccount!.email,
        photoUrl: googleSignInAccount!.photoUrl);

    notifyListeners();
  }

  //ForLogout
  allowUserToLogout() async {
    googleSignInAccount = await googleSignNow.signOut();

    googleUser = null;

    notifyListeners();
  }
}
