import '../models/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> updateQuantity(String itemId, int newQuantity);
}
