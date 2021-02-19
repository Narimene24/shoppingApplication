import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  static int _selectedIndex = 0;

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      NavigationBar._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        currentIndex: NavigationBar._selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
        iconSize: 35,
        backgroundColor: Colors.teal, // transparent
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}