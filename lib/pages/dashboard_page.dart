import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/post/add_new_post_page.dart';
import 'package:flutter/material.dart';

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
          title: const Text(SourceString.titleAppBar),
        ),
        body: const Center(
          child: Text(""),
        ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewPostPage()),
              );
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