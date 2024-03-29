import 'package:flutter/material.dart';
import 'package:resep_makanan/views/home.dart';
import 'package:resep_makanan/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Koki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const SplashScreen(),
    );
  }
}
