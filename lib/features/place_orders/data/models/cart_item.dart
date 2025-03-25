class CartItem {
  final String id;
  final String name;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      originalPrice: originalPrice,
      discountedPrice: discountedPrice,
      rating: rating,
      quantity: quantity ?? this.quantity,
    );
  }
}
