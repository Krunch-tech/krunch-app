import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BottomBar extends StatefulWidget {
  String? scanResult;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Future ScanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "0xff6666", "cancelButtonText", false, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = "failed to get platform version";
    }
    if (!mounted) return;
    return scanResult;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 10, 19, 38),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xff6271FF),
                    size: 24,
                  ),
                  onPressed: () {}),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                Icons.qr_code_scanner_rounded,
                size: 24,
                color: Color(0xff6271FF),
              ),
              onPressed: () {
                ScanBarcode();
              },
            ),
          )
        ],
      ),
    );
  }
}
