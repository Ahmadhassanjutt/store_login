import 'package:flutter/material.dart';

class CropScreen extends StatelessWidget {
  const CropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 🔝 TOP BAR
            Container(
              height: 50,
              color: Colors.black,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                  const Text(
                    "Crop the item",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 30),
                ],
              ),
            ),
            // 🖼 IMAGE + CROP AREA
            Expanded(
              child: Stack(
                children: [
                  // IMAGE PLACEHOLDER
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey.shade400, Colors.grey.shade600],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // DARK OVERLAY
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  // CROP AREA
                  Center(
                    child: Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Stack(
                        children: [
                          // TOP LEFT CORNER
                          corner(top: true, left: true),
                          // TOP RIGHT
                          corner(top: true, left: false),
                          // BOTTOM LEFT
                          corner(top: false, left: true),
                          // BOTTOM RIGHT
                          corner(top: false, left: false),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 🔻 BOTTOM BUTTON
            Container(
              height: 90,
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: Implement search functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Searching...')),
                    );
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔲 CORNER DESIGN
  Widget corner({required bool top, required bool left}) {
    return Positioned(
      top: top ? 0 : null,
      bottom: top ? null : 0,
      left: left ? 0 : null,
      right: left ? null : 0,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            top: top
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            bottom: !top
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            left: left
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            right: !left
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
