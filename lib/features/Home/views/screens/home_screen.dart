import 'package:ecommerce_app/features/Home/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  PromotionalCarousel(),
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
