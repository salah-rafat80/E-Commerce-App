import 'package:ecommerce_app/core/helper/navigatot_page.dart';
import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/features/my_orders/my_order_compelet_view.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_evel_butt.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_page_order.dart';
import 'package:flutter/material.dart';

import 'my_order_cancel_view.dart';
import 'order_details_Complete_view.dart';


class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,title: AppTextEn.orderDetails,),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 22,
            start: 22,
            top: 30,
            bottom: 13,
          ),
          child: Column(
            children: [
              defaultPageOrder(context:context,satuesTitle: AppTextEn.active),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300 ,
                child: Row(
                  spacing: 22,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defaultEvelButt(title: AppTextEn.canceledOrder, onPress: (){
                      AppNavigatorPage.navigateToPage(context: context, route: MyOrdersCancelView());
                    }),
                    defaultEvelButt(title: AppTextEn.trackDriver, onPress: (){
                      AppNavigatorPage.navigateToPage(context: context, route: OrderDetailsCompleteView());

                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
