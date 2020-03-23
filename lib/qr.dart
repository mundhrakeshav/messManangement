import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'loginPage.dart';

class qr extends StatefulWidget {
  @override
  _qrState createState() => _qrState();
}

class _qrState extends State<qr> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Show this QR at mess'),
      ),
      body: Center(
        child: QrImage(
          data: email + password,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
      ),
    );
  }
}
