import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ImageSnap/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _onDonePressed(BuildContext context) async {
    print(
      'Get Started pressed at ${DateTime.now()}',
    ); // 01:07 PM +0530 on Wednesday, June 18, 2025
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnboarding', false);
    if (context.mounted) {
      print('Navigating at ${DateTime.now()}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(), // Removed 'const'
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFF5F5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Welcome to ImageSnap',
            body: 'Enhance your images with advanced prediction features.',
            image: FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Icon(Icons.image, size: 150, color: Colors.blueAccent),
            ),
            decoration: PageDecoration(
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
              pageColor: Colors.white,
              imagePadding: const EdgeInsets.only(top: 50),
            ),
          ),
          PageViewModel(
            title: 'Upload Images',
            body: 'Easily upload your photos from gallery for analysis.',
            image: FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Icon(
                Icons.upload_rounded,
                size: 150,
                color: Colors.blueAccent,
              ),
            ),
            decoration: PageDecoration(
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
              pageColor: Colors.white,
              imagePadding: const EdgeInsets.only(top: 50),
            ),
          ),
          PageViewModel(
            title: 'Capture New Images',
            body: 'Use your camera to capture and analyze images instantly.',
            image: FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Icon(
                Icons.camera_alt_rounded,
                size: 150,
                color: Colors.blueAccent,
              ),
            ),
            decoration: PageDecoration(
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
              pageColor: Colors.white,
              imagePadding: const EdgeInsets.only(top: 50),
            ),
          ),
        ],
        done: GestureDetector(
          onTap: () => _onDonePressed(context),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              'Get Started',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        onDone:
            () {}, // Empty onDone since we're handling it in the done widget
        next: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
        skip: Text(
          'Skip',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        back: const Icon(Icons.arrow_back, color: Colors.blueAccent),
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          color: Colors.grey[400]!,
          activeSize: const Size(22, 10),
          activeColor: Colors.blueAccent,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        globalBackgroundColor: Colors.white,
      ),
    );
  }
}
