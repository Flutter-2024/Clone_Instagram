import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final _selectedBody = [
    const ProfilePage(),
    const ProfilePage(),
    const ProfilePage(),
    const ProfilePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text(SourceString.titleAppBar),
        // ),
        body: _selectedBody[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: SourceString.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: SourceString.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: SourceString.add,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              activeIcon: Icon(Icons.video_collection),
              label: SourceString.reels,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: SourceString.profile,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
        )
    );
  }
}

