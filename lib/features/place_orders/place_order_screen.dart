// ... (الاستيرادات السابقة)

import 'package:ecommerce_app/features/place_orders/views/widget/cart_item_widget.dart';
import 'package:ecommerce_app/features/place_orders/views/widget/total_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/cubit/cart_cubit.dart';
import 'manager/cubit/cart_state.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return CartCubit();
    },child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFF000000),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shopping List",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: context.read<CartCubit>().items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder:
                        (_, index) => CartItemWidget(
                      item: context.read<CartCubit>().items[index],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const TotalSection(),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    ),);
  }
}
