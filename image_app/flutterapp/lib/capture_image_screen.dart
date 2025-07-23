// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ImageSnap/success_screen.dart';
// import 'package:permission_handler/permission_handler.dart';

// class CaptureImageScreen extends StatefulWidget {
//   const CaptureImageScreen({super.key});

//   @override
//   State<CaptureImageScreen> createState() => _CaptureImageScreenState();
// }

// class _CaptureImageScreenState extends State<CaptureImageScreen> {
//   File? _image;

//   Future<void> _captureImage() async {
//     // Store the ScaffoldMessenger state before the async operation
//     final scaffoldMessenger = ScaffoldMessenger.of(context);

//     final status = await Permission.camera.request();
//     if (status.isGranted) {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: ImageSource.camera);

//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//         });
//       }
//     } else {
//       scaffoldMessenger.showSnackBar(
//         const SnackBar(content: Text('Camera permission denied')),
//       );
//     }
//   }

//   void _resetImage() {
//     setState(() {
//       _image = null;
//     });
//   }

//   void _uploadImage() {
//     if (_image != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SuccessScreen(imagePath: _image!.path),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please capture an image first')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Capture Image')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//               child: _image == null
//                   ? const Center(child: Text('No image captured'))
//                   : Image.file(_image!, fit: BoxFit.cover),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _captureImage,
//               child: const Text('Capture Image'),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _uploadImage,
//                   child: const Text('Upload'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _resetImage,
//                   child: const Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ImageSnap/success_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class CaptureImageScreen extends StatefulWidget {
  const CaptureImageScreen({super.key});

  @override
  State<CaptureImageScreen> createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  File? _image;

  Future<void> _captureImage() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Camera permission denied')),
      );
    }
  }

  void _resetImage() {
    setState(() {
      _image = null;
    });
  }

  void _uploadImage() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessScreen(imagePath: _image!.path),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please capture an image first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Capture Image',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F9FD), Color(0xFFDCE3F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFFFFF), Color(0xFFF4F4F4)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: _image == null
                        ? Center(
                            child: Text(
                              'No image captured',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ZoomIn(
                duration: const Duration(milliseconds: 1000),
                child: GradientButton(
                  text: 'Capture Image',
                  icon: Icons.camera_alt_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                  ),
                  onTap: _captureImage,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientButton(
                    text: 'Upload',
                    icon: Icons.upload_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
                    ),
                    onTap: _uploadImage,
                  ),
                  GradientButton(
                    text: 'Reset',
                    icon: Icons.refresh_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
                    ),
                    onTap: _resetImage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient gradient;

  const GradientButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
