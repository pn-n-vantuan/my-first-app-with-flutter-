// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

// ignore: unused_import
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('Scaffold Demo'),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.face),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        drawer: Drawer(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK')),
        ),
        endDrawer: Drawer(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: const Center(
            child: Text('Welcome to my App'),
          ),
        ),
      ),
    );
  }
}
