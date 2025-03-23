import 'package:flutter/material.dart';

import '../home_widget/home_widget.dart';

class TrendingProductsScreen extends StatelessWidget {
  const TrendingProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // bottomNavigationBar: BottomNavBar(),
       Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppbarHome(),
                  SizedBox(height: 20),
                  AllFeaturedList(),
                  ProductGridSection(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),

          // BottomNavBar(),
        ],
      );

      // floatingActionButton: FloatingAction(),


  }
}
