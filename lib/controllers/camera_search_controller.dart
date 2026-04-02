import 'package:camera/camera.dart';

class CameraSearchController {
  late List<CameraDescription> cameras;
  late CameraController controller;
  bool isRearCameraSelected = true;
  bool isFlashOn = false;

  Future<void> initializeCameras() async {
    cameras = await availableCameras();
    await initCamera(cameras[0]);
  }

  Future<void> initCamera(CameraDescription cameraDescription) async {
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );
    await controller.initialize();
  }

  Future<XFile?> takePicture() async {
    if (!controller.value.isInitialized) return null;
    final image = await controller.takePicture();
    return image;
  }

  Future<void> switchCamera() async {
    if (isRearCameraSelected) {
      await initCamera(cameras[1]);
    } else {
      await initCamera(cameras[0]);
    }
    isRearCameraSelected = !isRearCameraSelected;
  }

  Future<void> toggleFlash() async {
    if (isFlashOn) {
      await controller.setFlashMode(FlashMode.off);
    } else {
      await controller.setFlashMode(FlashMode.torch);
    }
    isFlashOn = !isFlashOn;
  }

  void dispose() {
    controller.dispose();
  }
}
