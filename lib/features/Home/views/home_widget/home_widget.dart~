import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/features/Home/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/resources_manager/constant/images/images.dart';
import '../../manager/cubit/home_state.dart';
import '../screens/Trending_Products_screen.dart';
import '../screens/home_screen.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.056,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.logo, fit: BoxFit.fill),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Text(
                'Stylish',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllFeaturedList extends StatelessWidget {
  const AllFeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            "All Featured",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List<Widget> Screen = [
                HomeScreen(),
                TrendingProductsScreen(),
                HomeScreen(),
              ];
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {

                        Get.to(Screen[index]);
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(child: images[index]),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(names[index]),
                  ],
                ),
              );
            },
            itemCount: images.length,
          ),
        ),
      ],
    );
  }
}

List<Image> images = [
  Image(image: AssetImage(AppImages.Beauty), fit: BoxFit.fill),
  Image(image: AssetImage(AppImages.Fashion), fit: BoxFit.fill),
  Image(image: AssetImage(AppImages.Kids), fit: BoxFit.fill),
  Image(image: AssetImage(AppImages.Mens), fit: BoxFit.fill),
  Image(image: AssetImage(AppImages.Womens), fit: BoxFit.fill),
];
List<String> names = ["Beauty", "Fashion", "Kids", "Mens", "Womens"];


class PromotionalCarousel extends StatefulWidget {
  const PromotionalCarousel({Key? key}) : super(key: key);

  @override
  State<PromotionalCarousel> createState() => _PromotionalCarouselState();
}

class _PromotionalCarouselState extends State<PromotionalCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<PromoItem> _promoItems = [
    PromoItem(
      imageAsset: AppImages.rectangleCarousel,
    ),
    // Add more promo items with different content/colors
    PromoItem(
      imageAsset: AppImages.rectangleCarousel,
    ),
    PromoItem(
      imageAsset: AppImages.rectangleCarousel,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _promoItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: PromoCard(promo: _promoItems[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _promoItems.length,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Color(0xffFFA3B3)
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromoItem {
  final String imageAsset;
  PromoItem({

    required this.imageAsset,
  });
}

class PromoCard extends StatelessWidget {
  final PromoItem promo;

  const PromoCard({
    Key? key,
    required this.promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        promo.imageAsset,
        fit: BoxFit.contain,
      ),
    );
  }
}


class ProductGridSection extends StatefulWidget {
  const ProductGridSection({Key? key}) : super(key: key);

  @override
  State<ProductGridSection> createState() => _ProductGridSectionState();
}

class _ProductGridSectionState extends State<ProductGridSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBestSelleing();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          child: Text(
            'Products',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {

          if (state is HomeSuccess) {
            return Builder(
              builder: (context) {
                return  GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // تغيير من 1 إلى 2 لعرض عنصرين في الصف
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: state.BestSelleing.length,
                  itemBuilder: (context, index) {
                    final product = state.BestSelleing[index].bestSellerProducts?[0]; // العنصر الأول فقط
                    return ProductCard(
                      name: product?.name ?? "No Name",
                      description: product?.description ?? "No Description",
                      price: product?.price.toString() ?? "0",
                      rating: product?.rating ?? 0.0,
                      reviewCount: '152,344',
                      imageAsset: product?.imagePath ?? "",
                      onTap: () {
                        Get.to(() => ProductDetailScreen());
                      },
                    );
                  },
                );
              }
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }, listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));// Show a SnackBar with the error state.message);
          }
        },),
      ],
    );
  }
}



class ProductCard extends StatelessWidget {
  final String name;
  final String description;

  final String price;
  final double rating;
  final String reviewCount;
  final String imageAsset;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.name,
    required this.description,

    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // تقليل حجم العمود إلى الحد الأدنى المطلوب
          children: [
            // Product image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                imageAsset,
                height: 170, // تقليل ارتفاع الصورة
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Product info
            Flexible(  // جعل المعلومات مرنة لتناسب المساحة المتبقية
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // تقليل حجم العمود الداخلي
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2), // تقليل المسافة
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2), // تقليل المسافة
                    // Text(
                    //   fabric,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.grey.shade600,
                    //   ),
                    // ),
                    const SizedBox(height: 4), // تقليل المسافة
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4), // تقليل المسافة

                    // Rating stars
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating.floor()
                                  ? Icons.star
                                  : index < rating
                                  ? Icons.star_half
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 16, // تصغير حجم النجوم
                            );
                          }),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          reviewCount,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = [
    const HomeScreen(),    // Replace with your actual Home screen
    const TrendingProductsScreen(),   // Replace with your actual Items screen
     // Replace with your actual Profile screen
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(100),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.sizzlingRed,
          unselectedItemColor: AppColors.black,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              activeIcon: Icon(Icons.shopping_cart_rounded),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


// void main() {
//   runApp(const StylishApp());
// }
//
// class StylishApp extends StatelessWidget {
//   const StylishApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stylish',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFFF83758),
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
//
// // HOME SCREEN
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             SvgPicture.asset(AppImages.logo, fit: BoxFit.fill),
//             const SizedBox(width: 8),
//             const Text('Stylish',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'All Featured',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Categories
//               SizedBox(
//                 height: 100,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildCategoryItem('Beauty', AppImages.Beauty),
//                     _buildCategoryItem('Fashion',AppImages.Fashion),
//                     _buildCategoryItem('Kids', AppImages.Kids),
//                     _buildCategoryItem('Mens', AppImages.Mens),
//                     _buildCategoryItem('Womens', AppImages.Womens),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//               const Text(
//                 'Products',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Products Grid
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//                 childAspectRatio: 0.7,
//                 children: [
//                   _buildProductCard(
//                     context,
//                     'Mens Starry',
//                     'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
//                     '₹399',
//                     4.5,
//                     AppImages.mensStarry,
//                   ),
//                   _buildProductCard(
//                     context,
//                     'Mens Starry',
//                     'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
//                     '₹399',
//                     4.5,
//                     AppImages.mensStarry,
//                     isFavorite: true,
//                   ),
//                   _buildProductCard(
//                     context,
//                     'Mens Starry',
//                     'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
//                     '₹399',
//                     4.5,
//                     AppImages.mensStarry,
//                   ),
//                   _buildProductCard(
//                     context,
//                     'Mens Starry',
//                     'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
//                     '₹399',
//                     4.5,
//                     AppImages.mensStarry,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black,
//         showUnselectedLabels: true,
//         currentIndex: 0,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Items',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryItem(String title, String imageAsset) {
//     return Column(
//       children: [
//         Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: AssetImage(imageAsset),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildProductCard(
//       BuildContext context,
//       String title,
//       String description,
//       String price,
//       double rating,
//       String imageAsset, {
//         bool isFavorite = false,
//       }) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                   child: Image.asset(
//                     imageAsset,
//                     height: 150,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: isFavorite ? Colors.red : Colors.grey,
//                       size: 24,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     description,
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontSize: 12,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     price,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       Icon(Icons.star_half, color: Colors.amber, size: 16),
//                       Text(
//                         ' 122,344',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// PRODUCT DETAIL SCREEN
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Product',
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),

                          ),
                        ]

                    ),
                  ),
                  SizedBox(height: 10),
                  // Product Image
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppImages.mensStarry,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Product Title and Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mens Starry',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Vision Alta Men\'s Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Price and Quantity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '100 \$',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF83758),
                              ),
                            ),
                            Row(
                              children: [
                                _buildQuantityButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _buildQuantityButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF83758),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 8),
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFFF83758).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFF83758),
        ),
      ),
    );
  }
}