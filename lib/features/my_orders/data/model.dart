class OrderModel {
  final int id;
  final String status;
  final String createdAt;
  final double total;
  final List<OrderItem> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.total,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'],
      createdAt: json['created_at'],
      total: double.parse(json['total'].toString()),
      items: (json['items'] as List).map((item) => OrderItem.fromJson(item)).toList(),
    );
  }
}

class OrderItem {
  final int productId;
  final int quantity;

  OrderItem({required this.productId, required this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {'product_id': productId, 'quantity': quantity};
}
