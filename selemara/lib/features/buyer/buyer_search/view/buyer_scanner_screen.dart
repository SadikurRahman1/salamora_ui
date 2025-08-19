import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:selemara/core/constants/app_responsive.dart';

import '../../../../core/widgets/custom_appbar.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String scannedResult = "";

  final res = AppResponsive();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      title: "Scanner",
      centerTitle: true,
      leading: Icon(Icons.arrow_back, size: res.wp(24)),
    ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  setState(() {
                    scannedResult = barcode.rawValue ?? "Unknown result";
                  });
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                scannedResult.isEmpty
                    ? "Scan any QR Code"
                    : "Result: $scannedResult",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
