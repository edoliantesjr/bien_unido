import 'package:bien_unido/screens/home_body/contact_body.dart';
import 'package:bien_unido/screens/home_body/developer_body.dart';
import 'package:bien_unido/screens/home_body/home_body.dart';
import 'package:bien_unido/screens/notification.dart';
import 'package:bien_unido/screens/signup.dart';
import 'package:bien_unido/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:bien_unido/screens/home_body/tourism_body.dart';
import 'package:bien_unido/screens/home_body/hotel_body.dart';
import 'package:bien_unido/screens/home_body/history_body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Widget? bodyWidget;
  HomeBody homeBody = HomeBody();
  String title = 'Welcome to Bien Unido!';
  AuthClass authClass = AuthClass();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    initWidget();
    return Scaffold(
      drawer: navigationDrawerWidget(),
      appBar: AppBar(
          actions: [
            
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const NotificationPage()));
                  },
                  child: const Icon(Icons.notifications, size: 30)))
          ],
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(color: Colors.grey[900], letterSpacing: 1),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue)),
      body: bodyWidget,
    );
  }
  void initWidget() {
    bodyWidget ??= homeBody.homeWidget(context);
  }
  Widget navigationDrawerWidget() {
    String? name = 'Guest Account';
    String? email = 'guest@bienunido.com';
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: <Widget>[
            buildHeader(name: name, email: email),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onTap: () {
                  setState(() {
                    bodyWidget = homeBody.homeWidget(context);
                    title = 'Welcome to Bien Unido!';
                  });
                  Navigator.of(context).pop();
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'History',
                icon: Icons.info,
                onTap: () {
                  setState(() {
                    bodyWidget = historyWidget();
                    title = 'About and History';
                  });
                  Navigator.of(context).pop();
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Tourism',
                icon: Icons.favorite,
                onTap: () {
                  setState(() {
                    bodyWidget = tourismWidget(context);
                    title = 'Tourism';
                  });
                  Navigator.of(context).pop();
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Place to stay',
                icon: Icons.hotel,
                onTap: () {
                  setState(() => bodyWidget = hotelWidget(context));
                  Navigator.of(context).pop();
                  title = 'Place To Stay';
                }),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.white70,
            ),
            buildMenuItem(
                text: 'Contact Us',
                icon: Icons.call,
                onTap: () {
                  setState(() => bodyWidget = contactUsWidget(context));
                  Navigator.of(context).pop();
                  title = 'Contact Us';
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Developers',
                icon: Icons.developer_mode,
                onTap: () {
                  setState(() => bodyWidget = developerWidget());
                  Navigator.of(context).pop();
                  title = 'Web App Developer';
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout_rounded,
                onTap: () {
                  setState(() {
                    authClass.signOut();
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => const SignUp()),
                      (route) => false);
                }),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem(
      {required String text, required IconData icon, required Function onTap}) {
    const color = Colors.white;
    const txtColor = Colors.white;
    const hoverColor = Colors.white54;

    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: txtColor, fontSize: 18, letterSpacing: 1),
      ),
      hoverColor: hoverColor,
      onTap: () {
        onTap();
      },
    );
  }
  Widget buildHeader({required String name, required String email}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const CircleAvatar(
              backgroundImage: AssetImage('assets/killua.jpg'), radius: 45),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(
                email,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

