import 'package:flutter/material.dart';
import 'package:kakar/pages/bookmark_page.dart';
import 'package:kakar/pages/explore_page.dart';
import 'package:kakar/pages/home_page.dart';
import 'package:kakar/pages/profile_page.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  int currentIndex = 0;
  List list = [
    HomePage(),
    ExplorePage(),
    BookMarkPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {
            currentIndex = index;

            print(currentIndex);
          });
        },
        elevation: 2.0,
        selectedLabelStyle:TextStyle(
          color: Colors.blue,
        ) ,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_sharp,
              color:currentIndex==0 ?Colors.blue: Colors.grey,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color:currentIndex==1 ?Colors.blue: Colors.grey,
              size: 24,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color:currentIndex==2 ?Colors.blue: Colors.grey,
              size: 24,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color:currentIndex==3 ?Colors.blue: Colors.grey,
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
