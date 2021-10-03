
import 'package:flutter/material.dart';

class NavigationDrawerWidget1 extends StatelessWidget {
  const NavigationDrawerWidget1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? name = 'Juan Dele Cruz';
    String? email = 'juan@delacruz.com';
    // String? imgPath="assets/killua.jpg";

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
                }),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'About Bien Unido', icon: Icons.info, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(text: 'Tourism', icon: Icons.favorite, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(text: 'Hotels', icon: Icons.hotel, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.white70,
            ),
            buildMenuItem(text: 'Contact Us', icon: Icons.call, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Developers', icon: Icons.developer_mode, onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: 'Logout', icon: Icons.logout_rounded, onTap: () {}),
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
              Text(name, style: const TextStyle(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text(
                email,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
