import 'package:flutter/material.dart';
import 'home_widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppbarHome(),
                  SizedBox(height: 20),
                  AllFeaturedList(),
                  PromotionalCarousel(),
                  ProductGridSection(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
