import 'package:bien_unido/models/destination.dart';
import 'package:bien_unido/screens/destination_screen.dart';
import 'package:flutter/material.dart';
@override
Widget tourismWidget(BuildContext context) {
  // ignore: unused_local_variable
  int index = 0;
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.indigo[50],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Explore',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Amazing Places!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),),],),],),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),),
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height - 250,
            child: PageView.builder(
                itemCount: destinations.length,
                controller: PageController(viewportFraction: 0.8),
                onPageChanged: (int index) => {
                      index = index,},
                itemBuilder: (context, i) {
                  return Transform.scale(
                    scale: i == -1 ? 1.0 : 0.9,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DestinationScreen(
                                  destination: destinations[i],
                                )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(destinations[i].image!),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(2, 3),
                                  )
                                ]),
                          ),
                          Text(
                            destinations[i].name!,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),),],),),);}),)],),),);}
