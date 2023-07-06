import 'package:flutter/material.dart';
import '/Pages/Home/QRScannerPage/mobile_qr_scanner.dart';

class BottomBar extends StatefulWidget {
  String? scanResult;

  BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 10, 19, 38),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xff6271FF),
                size: 24,
              ),
              onPressed: () {}),
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              size: 24,
              color: Color(0xff6271FF),
            ),
            onPressed: () {
              // ScanBarcode();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MobileQRScanner()));
            },
          )
        ],
      ),
    );
  }
}
