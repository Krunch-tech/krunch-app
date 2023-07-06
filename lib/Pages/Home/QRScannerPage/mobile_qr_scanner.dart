// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import '/Models/products.dart';
import '/Pages/Home/QRScannerPage/Widgets/product_exist_dialog_box.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../../Provider/api_call.dart';
import 'Widgets/alert_dialog_box.dart';

class MobileQRScanner extends StatefulWidget {
  const MobileQRScanner({super.key});

  @override
  State<MobileQRScanner> createState() => _MobileQrScannerState();
}

class _MobileQrScannerState extends State<MobileQRScanner> {
  MobileScannerController cameraController = MobileScannerController(
      detectionTimeoutMs: 10000, detectionSpeed: DetectionSpeed.normal);

  @override
  void initState() {
    super.initState();
    Provider.of<ApiCall>(context, listen: false).selectedRating = Rating.none;
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiCall>(context);
    final Set<String> scannedBarcodes = provider.scannedBarcodes;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            // color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.black,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          // return Stack(
          //   children: [
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scan QR Code',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 300.0,
                  width: 300.0,
                  child: MobileScanner(
                    controller: cameraController,
                    onScannerStarted: (arguments) {},
                    onDetect: (BarcodeCapture capture) {
                      final barcode = capture.raw[0]['displayValue'].toString();
                      debugPrint("The scanned barcode: $barcode");
                      if (!scannedBarcodes.contains(barcode)) {
                        scannedBarcodes.add(barcode);
                        provider.getProductDetails(barcode).then((result) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogBox(result: result);
                            },
                          ).then((value) {
                            Timer(const Duration(milliseconds: 500), () {
                              Navigator.pop(context, capture);
                            });
                          });
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(error.toString()),
                              showCloseIcon: true,
                            ),
                          );
                        });
                      } else if (scannedBarcodes.contains(barcode)) {
                        if (provider.products
                            .where(
                                (element) => element.barcodeNumber == barcode)
                            .toList()
                            .isNotEmpty) {
                          showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (context) => ProductExistDialog(
                                  result: provider.products
                                      .where((element) =>
                                          element.barcodeNumber == barcode)
                                      .toList()[0]));
                          // AlertDialogBox(
                          //       result: provider.products
                          //           .where((element) =>
                          //               element.barcodeNumber == barcode)
                          //           .toList()[0],
                          //     ));
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Align the QR code within the frame',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
