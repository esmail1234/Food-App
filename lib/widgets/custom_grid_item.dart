import 'package:flutter/material.dart';
import 'package:food_app/modules/product_details_screen.dart';

class CustomGridItem extends StatefulWidget {
  const CustomGridItem({super.key});

  @override
  State<CustomGridItem> createState() => _CustomGridItemState();
}

class _CustomGridItemState extends State<CustomGridItem> {
  List<Map<String, dynamic>> burgerItems = [
    {
      "image": "assets/images/image 3.png",
      "title": "Cheeseburger Wendy's Burger",
      "rating": "4.5",
      "isFavorite": false,
      "price": "5.99",
    },
    {
      "image": "assets/images/image 4.png",
      "title": "Chicken Burger Wendy's Burger",
      "rating": "4.2",
      "isFavorite": false,
      "price": "6.49",
    },
    {
      "image": "assets/images/image 5.png",
      "title": "Veggie Burger Wendy's Burger",
      "rating": "4.0",
      "isFavorite": false,
      "price": "4.99",
    },
    {
      "image": "assets/images/image 6.png",
      "title": "Frid Chicken Wendy's Burger",
      "rating": "4.9",
      "isFavorite": false,
      "price": "7.99",
    },
  ];
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: burgerItems.length,
      itemBuilder: (context, index) {
        final item = burgerItems[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProductDetailScreen(
                      imagePath: item['image'],
                      title: item['title'],
                      rating: item['rating'],
                      price: item['price'], heroTag: '',
                    ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // صورة الأكل
                Image.asset(
                  item['image'],
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                // العنوان
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                // Row للتقييم والقلب
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // النجمة والتقييم على الشمال
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          item['rating'].toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // القلب على اليمين
                    IconButton(
                      onPressed: () {
                        setState(() {
                          item['isFavorite'] = !item['isFavorite'];
                        });
                      },
                      icon: Icon(
                        item['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
