import 'package:flutter/material.dart';
import 'package:fmp/library.dart';
import 'package:fmp/playerUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FMP',
      theme: ThemeData(useMaterial3: true),
      home: const MusicPlayerHome(),
    );
  }
}

class MusicPlayerHome extends StatefulWidget {
  const MusicPlayerHome({super.key});

  @override
  State<MusicPlayerHome> createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
  int _selectedIndex = 0;
  bool _isPlayerExpanded = false;

  final List<Widget> _pages = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    const LibraryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _togglePlayerExpansion() {
    setState(() {
      _isPlayerExpanded = !_isPlayerExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _isPlayerExpanded ? null : AppBar(title: const Text('Music Player')),
      body:
          _isPlayerExpanded
              ? MusicPlayer(
                isExpanded: true,
                onToggleExpansion: _togglePlayerExpansion,
              )
              : _pages[_selectedIndex],
      bottomNavigationBar:
          _isPlayerExpanded
              ? null
              : BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_music),
                    label: 'Library',
                  ),
                ],
              ),
      bottomSheet:
          _isPlayerExpanded
              ? null
              : MusicPlayer(
                isExpanded: false,
                onToggleExpansion: _togglePlayerExpansion,
              ),
    );
  }
}
