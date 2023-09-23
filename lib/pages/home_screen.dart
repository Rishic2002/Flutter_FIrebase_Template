// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
