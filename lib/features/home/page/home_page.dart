import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FFF8),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Daily Tasks',
          style: GoogleFonts.poppins(
            color: const Color(0xFF354F52),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: const [
        _EventTile('zadanie 1'),
        _EventTile('zadanie 2'),
        _EventTile('zadanie 3'),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFDA769),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Color(0xFFF6FFF8),
        ),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile(this.title,{
    Key? key, 
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF52796F),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            color: const Color(0xFFFBFBFB),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
