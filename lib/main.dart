import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Barcode scan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 24.0),
          ),
        ),
        home: const BarCodeScanner(),
      );
}

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({super.key});

  @override
  BarCodeScannerState createState() => BarCodeScannerState();
}

class BarCodeScannerState extends State<BarCodeScanner> {
  String _scanBarcodeResult = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    )!
        .listen((barcode) => debugPrint(barcode));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Barcode scan',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize),
            ),
          ),
          body: Builder(
            builder: (context) => Container(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: scanBarcodeNormal,
                    child: const Text('Start barcode scan'),
                  ),
                  ElevatedButton(
                    onPressed: scanQR,
                    child: const Text('Start QR scan'),
                  ),
                  ElevatedButton(
                    onPressed: startBarcodeScanStream,
                    child: const Text('Start barcode scan stream'),
                  ),
                  Text(
                    'Scan result : $_scanBarcodeResult\n',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
