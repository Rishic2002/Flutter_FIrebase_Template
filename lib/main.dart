// ignore_for_file: library_private_types_in_public_api, avoid_print

//import 'package:WATTER/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:loginsigninforgot/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login/signin_page.dart';
import 'Theme/theme.dart';
import 'Theme/theme_manager.dart';
import 'Theme/themeprovider.dart';
import 'pages/bottom_navigation_bar.dart';
//Template with Theme  , Firebase Backend with UserDB Firestore
//Connect Firebase , Flutter Fire
//Forgot Password Pending 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: ThemeManager(),
      ), // Use the existing instance of ThemeManager
      ChangeNotifierProxyProvider<ThemeManager, ThemeProvider>(
        create: (_) => ThemeProvider(),
        update: (_, themeManager, themeProvider) {
          themeProvider!.themeData =
              themeManager.isDarkMode ? AppTheme().dark : AppTheme().light;
          return themeProvider;
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _loadLoginCredentials();
  }

Future<void> _loadLoginCredentials() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');

  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Check if sign-in was successful and retrieve the user ID
    if (userCredential.user != null) {
      _userId = userCredential.user!.uid;
    }
  } on FirebaseAuthException catch (e) {
    print('Error signing in with saved credentials: ${e.message}');
  }

  setState(() {
    _isLoading = false;
  });
}


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'My App',
          theme: themeProvider.themeData,
          home: _isLoading
              ? _buildLoadingScreen()
              : _userId != null
                  ? NavBottom(userId: _userId!)
                  : const SignInPage(),
        );
      },
    );
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
