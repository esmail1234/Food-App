import 'package:flutter/material.dart';
import 'package:food_app/modules/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _startAnimation = true;
      });
    });

    // الانتقال للشاشة الرئيسية بعد 3 ثواني
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _startAnimation ? 1.0 : 0.0,
              child: const Text(
                'Foodgo',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Lobster",
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _startAnimation ? -screenWidth * 0.05 : -screenWidth * 0.3,
            bottom: _startAnimation ? -20 : -200,
            child: Image.asset(
              'assets/images/image 2.png',
              width: screenWidth * 0.6,
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _startAnimation ? screenWidth * 0.4 : screenWidth,
            bottom: _startAnimation ? -30 : -200,
            child: Image.asset(
              'assets/images/image 1.png',
              width: screenWidth * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
