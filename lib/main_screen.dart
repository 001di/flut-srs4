import 'package:flutter/material.dart';
import 'pages/catalog_page.dart';
import 'pages/favorites_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'widgets/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Убран ключевое слово const из списка _pages
  final List<Widget> _pages = [
    const HomePage(),
    const CatalogPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}