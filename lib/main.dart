import 'package:appmaquette/screen/Repaired.dart';
import 'package:appmaquette/screen/call.dart';
import 'package:appmaquette/screen/clientslist.dart';
import 'package:appmaquette/screen/home_page.dart';
import 'package:appmaquette/screen/inorder.dart';
import 'package:appmaquette/screen/inservice.dart';
import 'package:appmaquette/screen/resairved.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ESHOP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/inservice': (context) => const Inservice(),
        '/reserved': (context)  => const Resairved(),
        '/repaired':  (context) => const Repaired(),
        '/clientslist':  (context) => const Clientslist(),
        '/inorder': (context) => const Inorder(),
        '/call':  (context) => const Call(),

      },
    );
  }
}
