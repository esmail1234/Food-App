import 'package:flutter/material.dart';

class CustomRangeCounter extends StatefulWidget {
  const CustomRangeCounter({super.key});

  @override
  State<CustomRangeCounter> createState() => _CustomRangeCounterState();
}

class _CustomRangeCounterState extends State<CustomRangeCounter> {
  int quantity = 1;
  double spicyLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SPICY SLIDER
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Mild',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Expanded(
                    child: Slider(
                      value: spicyLevel,
                      activeColor: const Color(0xFFEF2A39),
                      onChanged: (value) {
                        setState(() {
                          spicyLevel = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    'Hot',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),

        // QUANTITY
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (quantity > 1) {
                  setState(() => quantity--);
                }
              },
              icon: const Icon(Icons.remove),
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFEF2A39),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() => quantity++);
              },
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFEF2A39),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
