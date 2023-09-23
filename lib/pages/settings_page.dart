
// ignore_for_file: use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loginsigninforgot/Login/signin_page.dart';
import 'package:provider/provider.dart';


import '../Theme/theme_manager.dart';
import 'settings_list.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isDarkMode;
 final FlutterSecureStorage _storage = const FlutterSecureStorage();
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await _storage.deleteAll();
  // Navigate to the login screen
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const SignInPage()),
    (route) => false,
  );
}

  @override
  void initState() {
    super.initState();
    isDarkMode = true;
  }

  String? user;

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              SettingList(
                settingsTitle: isDarkMode ? "Dark Mode" : "Light Mode",
                //iconasset: AppAssets.moonIcon,
                isSuffixIcon: true,
                iconButton: CupertinoSwitch(
                  value: isDarkMode,
                  onChanged: ((value) {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                    themeManager.toggleTheme();
                  }),
                ),
              ),
              const Text(
                "User Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              SettingList(
                  isSuffixIcon: false,
                  settingsTitle: "Log Out",
                  onTap: () {
                   logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
