import 'package:flutter/material.dart';
import 'package:frontend/home_page.dart';

void main() => runApp(const SocketApp());

class SocketApp extends StatelessWidget {
  const SocketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Socket App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
