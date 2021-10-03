import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget contactUsWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.indigo[50],
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 10, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                        "Queries? Contact One of The Following",
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
                  contacts(
                      const Icon(Icons.location_on,
                          size: 70, color: Colors.white),
                      'www.bien-unido.gov.ph',
                      'www.bien-unido.gov.ph'),
                  contacts(
                      const Icon(Icons.email_rounded,
                          size: 70, color: Colors.white),
                      'bien-unido@gov.ph',
                      '"mailto:bien-unido@gov.ph?subject=Query&body=Your Query%20plugin"'),
                  contacts(
                      const Icon(Icons.phone_android,
                          size: 70, color: Colors.white),
                      '+639760060018',
                      'tel://09760060018'),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget contacts(Icon icon, String name, String url) {
  return Card(
    color: Colors.blueGrey[900],
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                height: 15,
              ),
              TextButton(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                onPressed: () async {
                  await launch(url);
                },
              ),

              // ignore: deprecated_member_use
            ],
          ),
        ],
      ),
    ),
  );
}
