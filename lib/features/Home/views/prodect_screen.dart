import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image with Like Button
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppImages.mensStarry,
                            width: double.infinity,
                            height: 308,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        right: 25,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Product Info
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mens Starry',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Vision Alta Men's Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              '100 \$',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove, color: Colors.grey),
                                    onPressed: () {},
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.add, color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add to Cart Button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text('Add To Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.2),
          //         spreadRadius: 1,
          //         blurRadius: 5,
          //       ),
          //     ],
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 8),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         const NavBarItem(icon: Icons.home_outlined, label: 'Home', isSelected: false),
          //         const NavBarItem(icon: Icons.search_outlined, label: 'Search', isSelected: false),
          //         const CircleAvatar(
          //           backgroundColor: Colors.redAccent,
          //           radius: 25,
          //           child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          //         ),
          //         const NavBarItem(icon: Icons.favorite_border_outlined, label: 'Wishlist', isSelected: false),
          //         NavBarItem(
          //           icon: Icons.person_outline,
          //           label: 'Profile',
          //           isSelected: false,
          //           extraWidget: Positioned(
          //             right: 0,
          //             top: 0,
          //             child: Container(
          //               padding: const EdgeInsets.all(4),
          //               decoration: const BoxDecoration(
          //                 color: Colors.redAccent,
          //                 shape: BoxShape.circle,
          //               ),
          //               child: const Text(
          //                 '2',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 10,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

