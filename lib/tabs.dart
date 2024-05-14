//import 'package:bitirme/imagepick.dart';
import 'package:bitirme/imagepick.dart';
import 'package:bitirme/imagepickpage.dart';
import 'package:bitirme/oylama.dart';
import 'package:bitirme/profile.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Oylama();
    var activePageTitle = 'Oylama';

    if (_selectedPageIndex == 1) {
      activePage = ImagePickPage();
      activePageTitle = 'ImagePick';
    }

    if (_selectedPageIndex == 2) {
      activePage = ProfilePage();
      activePageTitle = 'ImagePick';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.yellowAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      //drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.yellowAccent,
        onTap: _selectPage,
        currentIndex:
            _selectedPageIndex, //asagidaki tablardan birini sectiginde secili olan yaniyo
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: 'Oylama',
            backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_search),
            label: 'Foto',
            backgroundColor: Colors.amber
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 0, 195, 255)
          ),
        ],
      ),
    );
  }
}
