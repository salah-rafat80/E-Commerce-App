import 'package:ecommerce_app/features/my_orders/logic/order_logic/order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/logic/order_logic/order_state.dart';
import 'package:ecommerce_app/features/my_orders/widget/category_select_widget.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_info_order.dart';
import 'package:ecommerce_app/features/my_orders/widget/no_found_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/en.dart';


class MyOrdersActiveViews extends StatelessWidget {
  const MyOrdersActiveViews({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isActive = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderCubit>().fetchOrders(status: "active");
    });
    Future.microtask(
          () => context.read<OrderCubit>().fetchOrders(status: "active"),
    );

    return BlocProvider(create: (context) {
      return OrderCubit();
    },child: SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppTextEn.myOrders),
        body: Column(
          children: [
            categorySelectWidget(context, isActive: isActive),
            const SizedBox(height: 44),
            Expanded(
              child: BlocConsumer<OrderCubit, OrderState>(
                listener: (context, state) {
                  if (state is OrderError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OrderLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is OrderSuccess) {
                    if (state.orders.isEmpty) {
                      return noFoundOrder(context);
                    } else {
                      return ListView.builder(
                        itemCount: state.orders.length,
                        itemBuilder: (context, index) => DefaultInfoOrder(
                          isCompleted: true,
                        ),
                      );
                    }
                  }
                  return const Center(child: Text('No orders found'));
                },
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
