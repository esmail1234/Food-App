import 'package:flutter/material.dart';
import 'package:food_app/modules/PaymentScreen.dart';
import 'package:food_app/widgets/custom_header.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  // Spicy level (0-10)
  double spicyLevel = 5.0;

  // Portion counter
  int portionCount = 2;

  // Selected toppings
  Set<String> selectedToppings = {};

  // Selected side options
  Set<String> selectedSides = {};

  // Base price
  final double basePrice = 12.99;
  final double toppingPrice = 0.50;
  final double sidePrice = 1.50;

  // Calculate total price
  double get totalPrice {
    double total = basePrice * portionCount;
    total += selectedToppings.length * toppingPrice;
    total += selectedSides.length * sidePrice;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///================== IMAGE ==================///
                    Image.asset(
                      "assets/images/burger.png",
                      width: 250,
                      height: 320,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 20),

                    ///================== TITLE ==================///
                    Text(
                      "Customize Your Burger to Your Tastes.\nUltimate Experience",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 30),

                    ///================== SPICY & PORTION ==================///
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

                    const SizedBox(height: 10),

                    // Spicy Slider & Portion Counter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Spicy Slider
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Mild',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    activeTrackColor: Colors.red,
                                    inactiveTrackColor: Colors.red,
                                    thumbColor: Colors.red,
                                    overlayColor: Colors.red,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 8,
                                    ),
                                    trackHeight: 4,
                                  ),
                                  child: Slider(
                                    value: spicyLevel,
                                    min: 0,
                                    max: 10,
                                    divisions: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        spicyLevel = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                'Hot',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Portion Counter
                        Row(
                          children: [
                            // Decrease Button
                            GestureDetector(
                              onTap: () {
                                if (portionCount > 1) {
                                  setState(() {
                                    portionCount--;
                                  });
                                }
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            // Count Display
                            Text(
                              '$portionCount',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(width: 15),

                            // Increase Button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  portionCount++;
                                });
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ================= Toppings =================
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Toppings",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ToppingItem(
                            image: "assets/images/tomato.png",
                            title: "Tomato",
                            isSelected: selectedToppings.contains("Tomato"),
                            onTap: () {
                              setState(() {
                                if (selectedToppings.contains("Tomato")) {
                                  selectedToppings.remove("Tomato");
                                } else {
                                  selectedToppings.add("Tomato");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/onion.png",
                            title: "Onions",
                            isSelected: selectedToppings.contains("Onions"),
                            onTap: () {
                              setState(() {
                                if (selectedToppings.contains("Onions")) {
                                  selectedToppings.remove("Onions");
                                } else {
                                  selectedToppings.add("Onions");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/pickles.png",
                            title: "Pickles",
                            isSelected: selectedToppings.contains("Pickles"),
                            onTap: () {
                              setState(() {
                                if (selectedToppings.contains("Pickles")) {
                                  selectedToppings.remove("Pickles");
                                } else {
                                  selectedToppings.add("Pickles");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/bacon.png",
                            title: "Bacons",
                            isSelected: selectedToppings.contains("Bacons"),
                            onTap: () {
                              setState(() {
                                if (selectedToppings.contains("Bacons")) {
                                  selectedToppings.remove("Bacons");
                                } else {
                                  selectedToppings.add("Bacons");
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // ================= Side Options =================
                    const SizedBox(height: 25),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Side Options",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ToppingItem(
                            image: "assets/images/fries.png",
                            title: "Fries",
                            isSelected: selectedSides.contains("Fries"),
                            onTap: () {
                              setState(() {
                                if (selectedSides.contains("Fries")) {
                                  selectedSides.remove("Fries");
                                } else {
                                  selectedSides.add("Fries");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/coleslaw.png",
                            title: "Coleslaw",
                            isSelected: selectedSides.contains("Coleslaw"),
                            onTap: () {
                              setState(() {
                                if (selectedSides.contains("Coleslaw")) {
                                  selectedSides.remove("Coleslaw");
                                } else {
                                  selectedSides.add("Coleslaw");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/salad.png",
                            title: "Salad",
                            isSelected: selectedSides.contains("Salad"),
                            onTap: () {
                              setState(() {
                                if (selectedSides.contains("Salad")) {
                                  selectedSides.remove("Salad");
                                } else {
                                  selectedSides.add("Salad");
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          ToppingItem(
                            image: "assets/images/onions.png",
                            title: "Onion",
                            isSelected: selectedSides.contains("Onion"),
                            onTap: () {
                              setState(() {
                                if (selectedSides.contains("Onion")) {
                                  selectedSides.remove("Onion");
                                } else {
                                  selectedSides.add("Onion");
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // ================= Bottom Section =================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  // Order Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle order action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  PaymentScreen(orderAmount: totalPrice),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
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

// ================= Updated ToppingItem Widget =================
class ToppingItem extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ToppingItem({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(image, width: 45, height: 45),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.remove,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
