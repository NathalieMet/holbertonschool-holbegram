import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController:  PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body with PageView
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update index when page changes
          });
        },
        children: const [
          //Feed(),
          //Search(),
          //AddImage(),
          //Favorite(),
          //Profile(),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // Add shadow
        itemCornerRadius: 8, // Rounded corners
        curve: Curves.easeInBack, // Animation curve
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index; // Update selected index
          });
          _pageController.jumpToPage(index); // Navigate to the page
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
              'Feed',
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text(
              'Search',
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add),
            title: const Text(
              'Add',
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text(
              'Favorite',
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}




