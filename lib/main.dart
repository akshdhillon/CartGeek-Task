import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
        textTheme: GoogleFonts.alegreyaSansTextTheme(),
        primaryTextTheme: GoogleFonts.alegreyaSansTextTheme(),
      ),
      home: const MainPage(),
    );
  }
}
