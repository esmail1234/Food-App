import 'package:flutter/material.dart';
import 'package:food_app/widgets/bottom_bar_details.dart';
import 'package:food_app/widgets/custom_header.dart';
import 'package:food_app/widgets/custom_range_counter.dart';

class ProductDetailScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String price;
  final String heroTag;

  const ProductDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    required this.heroTag,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  double spicyLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ====================== HEADER ======================
            const CustomHeader(),

            // ====================== Photo ======================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE WITH HERO
                    Center(
                      child: Hero(
                        tag: widget.heroTag,
                        child: Image.asset(
                          widget.imagePath,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ====================== Title ======================
                    // PRODUCT DETAILS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // ====================== Rating ======================
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.rating,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  '26 mins',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          // ====================== Descrebtion ======================
                          Text(
                            "The ${widget.title} is made with fresh ingredients. Enjoy the juicy patty with perfect melted cheese!",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // SPICY + QUANTITY
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Spicy',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Portion',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          CustomRangeCounter(),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ====================== BOTTOM BAR ======================
            BottomBarDetails(price: widget.price),
          ],
        ),
      ),
    );
  }
}
