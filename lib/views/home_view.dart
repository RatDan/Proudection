import 'package:flutter/material.dart';
import 'package:proudection/views/add_view.dart';
import 'package:proudection/views/collection_view.dart';
import 'package:proudection/views/discover_view.dart';
import 'package:proudection/views/profile_view.dart';
import 'package:proudection/views/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const CollectionView(),
    const DiscoverView(),
    const ProfileView(),
    const SettingsView(),
    const AddView(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4.0,
          currentIndex: _selectedIndex < 4 ? _selectedIndex : 0,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Kolekcja',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              label: 'Odkryj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ustawienia',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _selectedIndex = 4;
            });
          },
        ),
      ),
    );
  }
}
