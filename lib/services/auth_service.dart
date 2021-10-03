import 'package:bien_unido/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;
  UserCredential? userCredential;
  GoogleSignInAccount? googleSignInAccount;
  final storage = const FlutterSecureStorage();
  Color errorColor = Colors.redAccent;
  Color? successColor = Colors.greenAccent[700];

  Future<void> googleSignIn(BuildContext context) async {
    try {
      googleSignInAccount = await _googleSignIn.signIn();
 if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
try {UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          storeTokenData(userCredential);
        } catch (e) {
          // ignore: avoid_print
          print(e);
        }
      } 
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } }
  Future<void> storeTokenData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
await storage.write( key: "userCredential", value: userCredential.toString());}
Future<String?> getToken() async {
  return await storage.read(key: "token");
  }
Future<void> logOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed", successColor!);
    };
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString(), successColor!);
    };
    // ignore: prefer_function_declarations_over_variables
    void Function(String verificationID, int? forceResnedingtoken) codeSent =
        (String verificationID, int? forceResnedingtoken) {
      showSnackBar(
          context, "Verification Code sent on the phone number", successColor!);
      setData(verificationID);
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out", errorColor);
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString(), errorColor);
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    // ignore: avoid_print
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => const Home()),
          (route) => false);

      showSnackBar(context, "logged In", successColor!);
    } catch (e) {
      showSnackBar(context, e.toString(), errorColor);
    }
  }

  void showSnackBar(BuildContext context, String text, Color color) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> senCodeWeb(String phone, BuildContext context) async {
    try {
      confirmationResult = await _auth.signInWithPhoneNumber(
        phone,
      );

      showSnackBar(context, "Verification code sent", successColor!);
    } catch (e) {
      showSnackBar(context, e.toString(), errorColor);
    }
  }

  Future<void> confirmCode(String code, BuildContext context) async {
    try {
      userCredential = await confirmationResult!.confirm(code);
      showSnackBar(context, "Verification complete", successColor!);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => const Home()),
          (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString(), errorColor);
    }
  }
  signOut() {
    _auth.signOut();
  }
}
