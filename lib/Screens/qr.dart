import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCODE extends StatelessWidget {
  final String value;
  final double width;

  const QRCODE({
    super.key,
    required this.value,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: value,
      version: QrVersions.auto,
      size: width,
      errorCorrectionLevel: QrErrorCorrectLevel.Q,
      foregroundColor: const Color(0xFF40A3C0),
      backgroundColor: const Color(0xFFFFFFFF),
    );
  }
}
