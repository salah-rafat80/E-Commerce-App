import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatelessWidget {
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
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Checkout',
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
          // Address Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Type address here\nor pick from map',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle address selection
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/Group.svg', // Ensure path is correct
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Shopping List
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),
                  // second Product
                  ProductCard(
                    imagePath: 'assets/images/product2.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),
                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),

                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),
                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),

                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),
                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),

                  ProductCard(
                    imagePath: 'assets/images/product1.png',
                    title: 'Cool Sneakers',
                    rating: '4.5',
                    price: '49.99',
                    oldPrice: '59.99',
                    totalOrderPrice: '99.98',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // Place Order Button
          Container(
            padding: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                // Handle order placement
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
                    'Place Order',
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
          ),
        ],
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final String imagePath, title, rating, price, oldPrice, totalOrderPrice;

  ProductCard({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    required this.oldPrice,
    required this.totalOrderPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),

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
                      SizedBox(height: 4),

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
              ],
            ),
            SizedBox(height: 12),

            // Total Order Price
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Order (1) :',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    totalOrderPrice,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
