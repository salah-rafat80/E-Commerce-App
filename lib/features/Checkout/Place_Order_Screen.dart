import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Scrollable shopping list
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shopping List Title
                  Text(
                    'Shopping List',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  // First Product
                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: "Women's Casual Wear",
                    rating: '4.8',
                    price: '\$34.00',
                    oldPrice: '\$64.00',
                  ),
                  SizedBox(height: 20),

                  // Second Product
                  ProductCard(
                    imagePath:
                        'assets/images/product2.png', // Removed extra spaces
                    title: "Men's Jacket",
                    rating: '4.7',
                    price: '\$45.00',
                    oldPrice: '\$67.00',
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom summary and checkout
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtotal
                SummaryRow(title: 'Subtotal', amount: '\$79.00'),
                SummaryRow(title: 'Tax and Fees', amount: '\$3.00'),
                SummaryRow(title: 'Delivery Fee', amount: '\$2.00'),

                // Total Amount
                Divider(),
                SummaryRow(
                  title: 'Order Total',
                  amount: '\$84.00',
                  isTotal: true,
                ),

                SizedBox(height: 16),

                // Checkout Button
                GestureDetector(
                  onTap: () {
                    // Handle checkout
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF83758),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final String imagePath, title, rating, price, oldPrice;

  ProductCard({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                // Rating
                Row(
                  children: [
                    Text(
                      rating,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, size: 14, color: Colors.amber),
                  ],
                ),
                SizedBox(height: 10),

                // Price
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      oldPrice,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Quantity Controls
          Column(
            children: [
              Row(
                children: [
                  QuantityControlButton('-', Color(0xFFFFCCD5)),
                  SizedBox(width: 8),
                  Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  QuantityControlButton('+', Color(0xFFF83758)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Quantity Control Button
Widget QuantityControlButton(String label, Color color) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Center(
      child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
    ),
  );
}

// Summary Row Widget
class SummaryRow extends StatelessWidget {
  final String title, amount;
  final bool isTotal;

  SummaryRow({required this.title, required this.amount, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              fontSize: isTotal ? 16 : 14,
              color: Colors.black,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
