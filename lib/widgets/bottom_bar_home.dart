// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentIndex = 0; // لتحديد العنصر المختار

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // البار الأحمر
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFEF2A39), // اللون الأحمر من التصميم
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIcon(Icons.home, 0),
                  _buildNavIcon(Icons.person_outline, 1),
                  const SizedBox(width: 60), // مساحة للزر الكبير
                  _buildNavIcon(Icons.chat_bubble_outline, 2),
                  _buildNavIcon(Icons.favorite_border, 3),
                ],
              ),
            ),
          ),

          // دائرة بيضاء خلف الـ FAB (لتأثير العمق)
          Positioned(
            top: -20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),

          // زر + الكبير (FAB)
          Positioned(
            top: -25,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2; // تحديث الـ index للزر الأوسط
                  });
                  // أضف الوظيفة هنا (مثل فتح صفحة إضافة منتج)
                },
                backgroundColor: const Color(0xFFEF2A39),
                elevation: 0,
                child: const Icon(Icons.add, size: 32, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    // تعديل currentIndex للأيقونات بعد الزر الأوسط
    int adjustedIndex = index >= 2 ? index + 1 : index;
    bool isSelected = currentIndex == adjustedIndex;

    return IconButton(
      onPressed: () {
        setState(() {
          currentIndex = adjustedIndex;
        });
        // هنا ممكن تضيف التنقل بين الصفحات حسب index
      },
      icon: Icon(
        icon,
        color: Colors.white.withOpacity(isSelected ? 1.0 : 0.7),
        size: 26,
      ),
    );
  }
}
