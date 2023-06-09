import 'package:chat_application/faetures/group_chat/presentation/screens/group_chat_screen.dart';
import 'package:chat_application/faetures/profile/presentation/screens/friends_screen.dart';
import 'package:chat_application/faetures/profile/presentation/screens/search_screen.dart';

import 'package:chat_application/faetures/profile/presentation/screens/settings_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [
    FrindsScreen(),
    GroupChatScreen(),
    SearchScreen(),
    const SettingsScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: GNav(
              backgroundColor: Colors.grey,
              activeColor: Colors.white,
              color: Colors.white,
              tabBackgroundColor: Colors.grey.shade900,
              gap: 9,
              onTabChange: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              padding: const EdgeInsets.all(8),
              tabs: const [
                GButton(
                  icon: Icons.people,
                  text: 'Friends',
                ),
                GButton(
                  icon: Icons.people_alt_rounded,
                  text: 'Group Chat',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                )
              ]),
        ),
      ),
    );
  }
}
