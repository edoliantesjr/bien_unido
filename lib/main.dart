// ignore: unused_import
import 'dart:io' show Platform;
import 'package:bien_unido/screens/home.dart';
import 'package:bien_unido/screens/loading_screen.dart';
import 'package:bien_unido/screens/signin.dart';
import 'package:bien_unido/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthClass _auth = AuthClass();
  Widget currentPage = const SignIn();
  @override
  void initState() {
    //checkLogin();
    super.initState();
  }
  void checkLogin() async {
    try {
      String? token = await _auth.getToken();
      if (token != null) {
        setState(() {
          currentPage = const Home();
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return const MaterialApp(
      title: 'Bien Unido Web App',
      home: LoadingScreen(),
    );
  }
  Widget detectPlatform() {
    Widget widget;
    // try{}catch(e){}
    if (defaultTargetPlatform == TargetPlatform.windows) {
      widget = Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
        child: Column(
          children: const [
            Text(
              'This Web Application',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
            Text(
              'Must Be Open On Mobile Devices',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ],
        ),
      ));
    } else {
      widget = const LoadingScreen();
    }
    return widget;
  }
}
