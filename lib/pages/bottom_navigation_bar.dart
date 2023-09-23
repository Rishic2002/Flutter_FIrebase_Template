
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:loginsigninforgot/pages/user_screen.dart';

import 'home_screen.dart';
import 'notification_screen.dart';
import 'settings_page.dart';

class NavBottom extends StatefulWidget {
  final String userId; // Pass the userId to the NavBottom widget

  const NavBottom({Key? key, required this.userId}) : super(key: key);

  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  final Color navigationBarColor = const Color.fromARGB(255, 192, 238, 242);
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
         HomeScreen(),   // HomeScreen(userId: ''),
        
            NotificationPage(),
            UserPage( userId: widget.userId),
            const SettingsPage()
          ],
        ),
        bottomNavigationBar: FloatingNavbar(
          backgroundColor:  const Color.fromARGB(
                    255, 5, 191, 219),
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
            );
          },
          currentIndex: selectedIndex,
          items: <FloatingNavbarItem>[
            FloatingNavbarItem(icon: Icons.bookmark_rounded),
            FloatingNavbarItem(icon: Icons.book),
            FloatingNavbarItem(icon: Icons.notification_add),
            FloatingNavbarItem(icon: Icons.person_off_outlined),
          ],
        ),
      ),
    );
  }
}


