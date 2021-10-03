import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:bien_unido/screens/home.dart';

class HomeBody {
  Widget homeWidget(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.indigo[900],
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'Town',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Bien Unido, Bohol',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.indigo[500],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/white-logo.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Population',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '26,666',
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Barangay',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.flag,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  Text(
                                    '15',
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'District      ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.map,
                                      size: 30, color: Colors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Covid +   ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.airline_seat_flat_rounded,
                                      size: 35, color: Colors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Date: '
                            '$formatter',
                            style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                         // goTourism();
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
