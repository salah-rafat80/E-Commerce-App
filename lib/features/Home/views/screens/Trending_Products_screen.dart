import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/home_cubit.dart';
import '../home_widget/home_widget.dart';

class TrendingProductsScreen extends StatelessWidget {
  const TrendingProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return HomeCubit()..getBestSelleing();
    },child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppbarHome(),
                  SizedBox(height: 20),
                  AllFeaturedList(),
                  // PromotionalCarousel(),
                  Builder(
                      builder: (context) {
                        return ProductGridSection();
                      }
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}
