import 'package:flutter/material.dart';

Widget developerWidget() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/dev99.jpg'),
                  radius: 80.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Rolando Edoliantes',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.amber[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'rolando@gmail.com',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                      letterSpacing: 2.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Text(
                      "My Team",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                team('assets/dev2.jpg', 'Peter John Flores',
                    'peterjohn@gmail.com'),
                team('assets/dev3.jpg', 'Edmon Ibaoc', 'moniks@gmail.com'),
                team('assets/dev4.jpg', 'Cheryl Quisto', 'cheche@gmail.com'),
                team(
                    'assets/dev5.jpg', 'Danilyn Perolino', 'danilyn@gmail.com'),
                team('assets/dev6.jpg', 'Aiza Rosales', 'aiza@gmail.com'),
                team('assets/dev7.jpg', 'Ma. Flor Albino', 'flor@gmail.com'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget team(String img, String name, String email) {
  return Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 40.0,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.grey[850],
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange[900],
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // ignore: deprecated_member_use
            ],
          ),
        ],
      ),
    ),
  );
}
