import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources_manager/shared_styles/colors.dart';
import '../../data/models/cart_item.dart';
import '../../manager/cubit/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero, // إزالة الحشو الداخلي
          leading: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/images/${item.id}.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, // زيادة حجم النص
              color: Color(0xFF000000),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.rating.toStringAsFixed(1),
                    style: TextStyle(color: Color(0xFFF83758), fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < item.rating.floor()
                          ? Icons.star
                          : Icons.star_border,
                      color: Color(0xFFF83758),
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "\$${item.discountedPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Color(0xFFF83758),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "\$${item.originalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFCCD5).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Color(0xFFF83758), size: 20),
                  onPressed:
                      () => context.read<CartCubit>().updateQuantity(
                        item.id,
                        item.quantity - 1,
                      ),
                ),
                Text(
                  item.quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xFFF83758), size: 20),
                  onPressed:
                      () => context.read<CartCubit>().updateQuantity(
                        item.id,
                        item.quantity + 1,
                      ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.dividerColor, height: 1, thickness: 1),
      ],
    );
  }
}
