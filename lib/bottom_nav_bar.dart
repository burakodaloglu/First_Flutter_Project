import 'package:flutter/material.dart';
import 'package:flutter_first_app/home_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBarWidget();
}

class _BottomNavBarWidget extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetBodies = <Widget>[
    HomeScreenWidget(),
    Text("Search"),
    Text("2.Sayfa"),
    Text("3.Sayfa")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetBodies.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
        ], currentIndex: _selectedIndex, onTap: _onItemTapped),
      ),
    );
  }
}
