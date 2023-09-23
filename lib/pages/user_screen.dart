// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _username = 'Username';
  String _societyName = 'Society Name';

  Future<void> _fetchUserData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          setState(() {
            _username = data["name"] as String? ?? 'Default Username';
            _societyName =
                data["societyname"] as String? ?? 'Default Society Name';
          });
        }
      }
    } catch (error) {
     const CircularProgressIndicator();
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        // Wrap the Column with Center widget
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              const SizedBox(height: 16),
              Text(
                'Username: $_username',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              Text(
                'Society Name: $_societyName',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
