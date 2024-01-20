import 'package:flutter/material.dart';

void main() {
  runApp(const CloneInstagramApp());
}

class CloneInstagramApp extends StatelessWidget {
  const CloneInstagramApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone Instagram',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clone Instagram'),
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
          switch(index){
            case 0:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NewsFeedPage()),
              // );
              break;
            case 1:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SearchPage()),
              // );
              break;
            case 2:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddNewPostPage()),
              // );
              break;
            case 3:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ReelsPage()),
              // );
              break;
            case 4:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfileDetailPage()),
              // );
              break;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      )
    );
  }
}


