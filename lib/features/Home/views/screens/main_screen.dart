import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/features/Home/views/shared_widgit/profile_screen.dart';
import 'package:ecommerce_app/features/Home/views/shared_widgit/shared_widgt.dart';
import 'package:flutter/material.dart';

import 'Trending_Products_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static final List<Widget> _screens = [
    const HomeScreen(),
    const TrendingProductsScreen(),
    const ProfileScreen(),
  ];
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MainScreen._screens[_selectedIndex],
        floatingActionButton: FloatingAction(),
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(100),
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.sizzlingRed,
            unselectedItemColor: AppColors.black,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: bottomNavItems,
          ),
        ),
      ),
    );
  }
}

