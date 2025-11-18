import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_app_bar.dart';
import 'package:food_app/widgets/bottom_bar_home.dart';
import 'package:food_app/widgets/custom_categories.dart';
import 'package:food_app/widgets/custom_grid_item.dart';
import 'package:food_app/widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const CustomAppBar(),

                const SizedBox(height: 40),
                // Search Bar
                const CustomSearchBar(),

                const SizedBox(height: 40),

                // Content Placeholder
                CustomCategories(),

                const SizedBox(height: 20),

                // food items placeholder
                const CustomGridItem(),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}

