// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:ImageSnap/home_screen.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'ImageSnap',
// //       debugShowCheckedModeBanner:
// //           false, // Add this line to remove the debug banner
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
// //         scaffoldBackgroundColor: Colors.transparent,
// //       ),
// //       home: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Colors.blueAccent, Colors.purpleAccent],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: const HomeScreen(),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ImageSnap/onboarding_screen.dart';
// import 'package:ImageSnap/home_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   final showOnboarding = prefs.getBool('showOnboarding') ?? true;

//   runApp(MyApp(showOnboarding: showOnboarding));
// }

// class MyApp extends StatelessWidget {
//   final bool showOnboarding;

//   const MyApp({super.key, required this.showOnboarding});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: showOnboarding ? OnboardingScreen() : HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ImageSnap/onboarding_screen.dart';
import 'package:ImageSnap/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = prefs.getBool('showOnboarding') ?? true;

  runApp(MyApp(showOnboarding: showOnboarding));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  const MyApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageSnap',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: showOnboarding
          ? OnboardingScreen()
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: HomeScreen(),
            ),
    );
  }
}
