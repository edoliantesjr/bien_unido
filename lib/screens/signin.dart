import 'package:bien_unido/screens/home.dart';
import 'package:bien_unido/screens/phone_auth.dart';
import 'package:bien_unido/screens/signup.dart';
import 'package:bien_unido/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final AuthClass _authClass = AuthClass();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              altSignIn('google.svg', 'Google', () async {
                try {
                  // dynamic acctInfo =
                  await _authClass.googleSignIn(context);
                  if (_authClass.googleSignInAccount != null) {
                    final success = SnackBar(
                      content: const Text('Sucess: Google Account Signin'),
                      backgroundColor: Colors.greenAccent[700],
                    );
                    ScaffoldMessenger.of(context).showSnackBar(success);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => const Home()),
                        (route) => false);
                  } else {
                    const err = SnackBar(
                      content: Text('Google Acct. Link Cancelled'),
                      backgroundColor: Colors.redAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(err);
                  }
                } catch (e) {
                  const error = SnackBar(
                    content: Text("Error Google Account Signing In"),
                    backgroundColor: Colors.redAccent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(error);
                }
              }),
              const SizedBox(
                height: 15,
              ),
              altSignIn('phone.svg', 'Mobile', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const PhoneAuthPage()));
              }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Or',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              emailPassTxtField('Email', _emailController),
              const SizedBox(
                height: 10,
              ),
              emailPassTxtField('Password', _passController),
              const SizedBox(
                height: 10,
              ),
              signInButton(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you don't have an Account? ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      try {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUp()),
                            (route) => false);
                      } catch (e) {
                        final error = SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: Colors.redAccent,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(error);
                      }},
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ), )],),
              const SizedBox(height: 8),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),],),),), );}

  Widget altSignIn(String img, String name, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 1, color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/$img',
                height: 25,
                width: 25,
              ),
              const SizedBox(width: 20),
              Text(
                'Continue with $name',
                style: const TextStyle(fontSize: 17),
              )],),),),);}

  Widget emailPassTxtField(String labelText, TextEditingController controller) {
    bool? isPass = (labelText == 'Password') ? true : false;

    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width - 70,
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        autofocus: true,
        obscureText: isPass,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 17, color: Colors.white, letterSpacing: 1),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(width: 1.5, color: Colors.blueAccent)),
        ), ), ); }
  Widget signInButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
                  email: _emailController.text, password: _passController.text);
          final success = SnackBar(
            content: const Text('Success: Sign in'),
            backgroundColor: Colors.greenAccent[700],
          );
          ScaffoldMessenger.of(context).showSnackBar(success);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => const Home()),
              (route) => false);
          // ignore: avoid_print
          print(userCredential.user!.email);
        } catch (e) {
          final error = SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.redAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(error);
          setState(() {
            circular = false;
          });}},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 70,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFF1778F7),
            Color(0xFF2962FF),
            Color(0xFF1778F7),
          ]),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: circular
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
        ),),);}}
