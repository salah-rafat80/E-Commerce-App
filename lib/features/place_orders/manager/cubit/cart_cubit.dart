import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cart_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> _items = [
    CartItem(
      id: "1",
      name: "Women's Casual Wear",
      originalPrice: 64.0,
      discountedPrice: 34.0,
      rating: 4.8,
      quantity: 1, // <-- تأكد من وجود quantity في النموذج
    ),
    CartItem(
      id: "2",
      name: "Men's Jacket",
      originalPrice: 67.0,
      discountedPrice: 45.0,
      rating: 4.7,
      quantity: 1, // <-- تأكد من وجود quantity في النموذج
    ),
  ];
  List<CartItem> get items => _items;
  CartCubit() : super(CartInitial());

  // الحسابات التلقائية
  double get subtotal => _items.fold(
    0,
    (sum, item) => sum + (item.discountedPrice * item.quantity),
  );
  double get tax => 3.0;
  double get deliveryFee => 2.0;
  double get total => subtotal + tax + deliveryFee;

  void updateQuantity(String itemId, int newQuantity) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(quantity: newQuantity);
      emit(CartUpdated(_items));
    }
  }
}
