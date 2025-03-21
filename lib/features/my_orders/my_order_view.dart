import 'package:ecommerce_app/features/my_orders/logic/toggle_cubit.dart';
import 'package:ecommerce_app/features/my_orders/logic/toggle_state.dart';
import 'package:ecommerce_app/features/my_orders/widget/no_found_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_order_active_view.dart';
import 'my_order_cancel_view.dart';
import 'my_order_compelet_view.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleCubit(index: 0),
      child: SafeArea(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return Column(
                children: [
                  BlocBuilder<ToggleCubit, ToggleState>(
                    builder: (context, state) {
                      final cubit = context.read<ToggleCubit>();
                      if (state is ToggleLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ToggleFailure) {
                        return noFoundOrder(context);
                      }

                      Widget currentView = const SizedBox();
                      if (cubit.index == 0) {
                        currentView = MyOrdersActiveViews();
                      } else if (cubit.index == 1) {
                        currentView = MyOrdersComplView();
                      } else if (cubit.index == 2) {
                        currentView = MyOrdersCancelView();
                      }
                      return Expanded(
                        child: AnimatedSwitcher(
                          switchInCurve: Curves.easeInCirc,
                          duration: const Duration(seconds: 1),
                          child: currentView,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
