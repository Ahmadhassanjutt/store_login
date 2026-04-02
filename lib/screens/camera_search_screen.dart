import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../controllers/camera_search_controller.dart';

class CameraSearchScreen extends StatefulWidget {
  const CameraSearchScreen({super.key});

  @override
  _CameraSearchScreenState createState() => _CameraSearchScreenState();
}

class _CameraSearchScreenState extends State<CameraSearchScreen> {
  late CameraSearchController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraSearchController();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initializeCameras();
    setState(() {
      _isInitialized = true;
    });
  }

  // 📸 Capture Image
  Future<void> takePicture() async {
    final image = await _controller.takePicture();
    if (image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image saved: ${image.path}")),
      );
    }
  }

  // 🔄 Switch Camera
  void switchCamera() async {
    await _controller.switchCamera();
    setState(() {});
  }

  // ⚡ Toggle Flash
  void toggleFlash() async {
    await _controller.toggleFlash();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      // 🔹 AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Search by taking a photo",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // 🔹 Camera Preview
      body: _controller.controller.value.isInitialized
          ? CameraPreview(_controller.controller)
          : Center(child: CircularProgressIndicator()),
      // 🔹 Bottom Controls
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 40),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ⚡ Flash
            IconButton(
              onPressed: toggleFlash,
              icon: Icon(
                _controller.isFlashOn ? Icons.flash_on : Icons.flash_off,
                size: 28,
                color: Colors.black,
              ),
            ),
            // 📸 Capture
            GestureDetector(
              onTap: takePicture,
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt,
                    color: Colors.white, size: 30),
              ),
            ),
            // 🔄 Switch Camera
            IconButton(
              onPressed: switchCamera,
              icon: Icon(Icons.cameraswitch,
                  size: 28, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
