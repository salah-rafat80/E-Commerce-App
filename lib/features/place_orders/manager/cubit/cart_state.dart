import 'package:flutter/cupertino.dart';

import '../../data/models/cart_item.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  CartLoaded(this.items);
}

class CartUpdated extends CartState {
  // <-- أضف هذه الحالة
  final List<CartItem> items;
  CartUpdated(this.items);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
