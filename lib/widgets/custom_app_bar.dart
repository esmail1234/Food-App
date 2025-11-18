import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foodgo',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Lobster",
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Order your favourite food!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/main.jpg'),
        ),
      ],
    );
  }
}
