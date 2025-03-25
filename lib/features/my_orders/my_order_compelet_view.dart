import 'package:ecommerce_app/features/my_orders/logic/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/my_orders/logic/order_logic/order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/logic/order_logic/order_state.dart';
import 'package:ecommerce_app/features/my_orders/widget/category_select_widget.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_info_order.dart';
import 'package:ecommerce_app/features/my_orders/widget/no_found_order.dart';
import '../../core/localization/en.dart';
import 'data/repo.dart';

class MyOrdersComplView extends StatelessWidget {
  const MyOrdersComplView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isComplete = true;

    // Fetch only completed orders when this view is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderCubit>().fetchOrders(status: "completed");
    });
    Future.microtask(
          () => context.read<OrderCubit>().fetchOrders(status: "completed"),
    );

    return BlocProvider(create: (context) {
      return OrderCubit();
    },child: SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppTextEn.myOrders),
        body: Column(
          children: [
            categorySelectWidget(context, isCompleted: isComplete),
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
