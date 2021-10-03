import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget historyWidget() {
  String s1 =
      'Bien Unido, officially the Municipality of Bien Unido - is a 4th class municipality in the province of Bohol, Philippines. According to the 2015 census, it has a population of 27,115 people.';
  String s2 =
      """"Bien Unido " is a Spanish phrase translating to "well united " in English. In 1935, two sitios in northern Trinidad were united into one barangay under an executive order and was given the name Bien Unido.""";
  String s3 =
      'Bien Unido is the youngest municipality in Bohol being founded in 1981 after it was carved out and separated from the municipalities of Trinidad and Talibon.';
  String s4 =
      'Bien Unido comprises 15 barangays namely: Bilangbilangan Dako, Bilangbilangan Diot, Hingotanan East, Hingotanan West, Liberty, Malingin, Mandawa, Maomawan, Nueva Esperanza, Nueva Estrella, Pinamgo, Poblacion, Puerto San Pedro, Sagasa, and Tuboran';
  String s5 =
      'Fishes caught are brought and sold in Cebu while mats have markets in Mindanao, Leyte and Cebu. Seaweed industry is recently the main livelihood in the municipality. The farmed seaweeds are used as essential ingredient for gel capsules, soap, toothpaste, slippers and other plastic wares.';
  String s6 =
      'The majority of the inhabitants of Bien Unido are Roman Catholics and much of their faith revolves around their church whose feast day falls on December 28 and advocated to the Holy Child Jesus or the Santo Niño.';

  return SingleChildScrollView(
    child: Container(
      // color: const Color(0x42834EFF),
      color: Colors.indigo[50],
      child: Column(
        children: [
          cardHistory("Bien Unido", 'Municipality', s1),
          cardHistory("1935", 'History', s2),
          cardHistory("1981", 'History', s3),
          cardHistory("Barangay", '15 Barangays', s4),
          cardHistory("Economy", 'Fishing & Seaweed', s5),
          cardHistory("Religion", 'Catholic', s6),
          const SizedBox(
            height: 30,
          ),],),),);}

Widget cardHistory(String title, String header, String details) {
  return Card(shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.white70, width: 1),borderRadius: BorderRadius.circular(30),
    ),margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Padding(padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.grey[850],                letterSpacing: 1),
          ),
          const SizedBox(height: 5, ),
          Text(
            header,style: TextStyle(fontSize: 19,color: Colors.orange[900],letterSpacing: 1,),),
          const SizedBox(
            height: 6,
          ),
          // ignore: deprecated_member_use
          Text(
            details, style: TextStyle(fontSize: 14,color: Colors.grey[900],letterSpacing: 1,),textAlign: TextAlign.left,
          ),],),),);}
