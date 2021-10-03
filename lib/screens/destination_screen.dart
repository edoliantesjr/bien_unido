import 'package:flutter/material.dart';
import 'package:bien_unido/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({Key? key, required this.destination})
      : super(key: key);
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Color white = Colors.black;
  Icon fav = const Icon(Icons.favorite_outline);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.destination.image!),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 10,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            )),
                        const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.black,
                            )),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      transform: Matrix4.translationValues(0, 20, 0),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (white == Colors.black) {
                                  white = Colors.red;
                                  fav = const Icon(Icons.favorite);
                                } else {
                                  white = Colors.black;
                                  fav = const Icon(Icons.favorite_outline);
                                }
                              });
                            },
                            icon: fav,
                            color: white,
                            iconSize: 30,
                          )),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.destination.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.destination.description!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
