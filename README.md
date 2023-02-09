## 1. Research: Flutter Barcode Scanner Package

- Keywords:
    - flutter barcode scanner
    - flutter-barcode-scanner github
    - flutter barcode scanner not working
    - flutter barcode scanner example
    - flutter scan qr code from image
    - flutter scanner
    - qr code scanner in flutter with source code
    - qr code scanner github
    - flutter scanner app github
    - custom barcode scanner flutter
    - flutter barcode scanner tutorial
    - flutter qr code scanner
    - flutter barcode-scanner github
    - flutter barcode scanner
    - flutter scanner app github
    - mobile scanner flutter
    - qr code scanner flutter github
    - mobile scanner flutter github
    - qr code scanner flutter
- Video Title: Flutter Barcode Scanner - QR Code and Barcode mobile scanner app example with github source code


## 2. Research: Competitors

**Flutter Videos/Articles**

- 21K: https://www.youtube.com/watch?v=WnYtY37Fru4
- 3K: https://www.youtube.com/watch?v=UAQVxJplGZk
- 3K: https://www.youtube.com/watch?v=P4TtX-NDlkg
- 4K: https://www.youtube.com/watch?v=ZIlzWIxsN1g
- 5K: https://www.youtube.com/watch?v=y_yCNO3Rcko
- https://pub.dev/packages/flutter_barcode_scanner
- https://medium.flutterdevs.com/explore-barcode-scanner-in-flutter-b53c6d875444
- https://docs.flutterflow.io/actions/actions/ui-interactions/scan-barcode-qr-code

**Android/Swift/React Videos**

- 24k: https://www.youtube.com/watch?v=jtT60yFPelI
- 65K: https://www.youtube.com/watch?v=wfucGSKngq4
- 102K: https://www.youtube.com/watch?v=drH63NpSWyk
- 30K: https://www.youtube.com/watch?v=Sb4avOp7D_k
- 14K: https://www.youtube.com/watch?v=nsL79UTmK94
- 1.6K: https://www.youtube.com/watch?v=hoxjqvVp9E4
- 5.5K: https://www.youtube.com/watch?v=j3MODOPZINs
- 10K: https://www.youtube.com/watch?v=QHouskATQ5U
- 2K: https://www.youtube.com/watch?v=y63HfyMWLOo
- https://developers.google.com/ml-kit/vision/barcode-scanning/android
- https://medium.com/analytics-vidhya/creating-a-barcode-scanner-using-android-studio-71cff11800a2
- https://www.javatpoint.com/android-qr-code-or-bar-code-scanner
- https://levelup.gitconnected.com/building-bar-code-scanner-app-in-swift-1de4ab1e1079
- https://www.hackingwithswift.com/example-code/media/how-to-scan-a-barcode
- https://heartbeat.comet.ml/building-a-barcode-scanner-in-swift-on-ios-9ad550e8f78b
- https://scanbot.io/developer/ios-barcode-scanner-sdk/
- https://abhimuralidharan.medium.com/how-to-create-a-simple-qrcode-barcode-scanner-app-in-ios-swift-fd9970a70859

**Great Features**
- Barcode scanning support on Android and iOS. Supports barcodes, QR codes, etc. Action Type as Scan Barcode/QR code.
- You can find more at (medium.com)[https://medium.flutterdevs.com/explore-barcode-scanner-in-flutter-b53c6d875444].

**Problems from Videos**
- Question: Does barcode scanning work if running in flutter web?
  Answer: I don't know.
- Question: How to collect the data from the bar code and display in another page?
  Answer: After you get data on scan, you can navigate to another page with scanned data is one way. another is use shared preferences, save data on scan and get data wherever you need it.
- Question: Is there any package or examples to develop QR Code Scanner for flutter using web camera for laptop/desktop?
  Answer: please check this (link)[https://stackoverflow.com/questions/64283370/possibilities-to-scan-qr-code-in-flutter-web]. Hope this would help you.
- Question: Is there anyway to scan without open camera UI?
  Answer: I don't know.

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/71318474/flutter-barcode-scanner-android-issue
- https://stackoverflow.com/questions/73341747/barcode-flutter-scan-doesnt-get-result-mobile-app

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. Barcodes and QR codes are frequently used to store various types of data. Barcode readers capture and translate barcodes into numbers and/or letters for translation.
2. Main Points
    - Create method `scanQR()` with mode `ScanMode.QR` and call it on `Start QR scan` button.
    - Create method `scanBarcodeNormal()` with mode `ScanMode.QR` and call it on `Start barcode scan` button.
3. This package is used to scan QR and Barcodes and shows result in the form of `barcodeScanRes` string.

**The Structured Main Content**
1. Run `dart pub add flutter_barcode_scanner` in terminal to add `flutter_barcode_scanner` in your pubspec.yaml file.
2. For this video:
    - Setup Android & iOS
        - For Android, you don't need to do anything.
        - For iOS, it requires Swift support. You can check and set configuration for iOS of your project by visiting (pub.dev/packages/flutter_barcode_scanner) [https://pub.dev/packages/flutter_barcode_scanner#ios---requires-swift-support]. After this configuration, to use on iOS, you will need to add the camera usage description. To do that open the Xcode and add camera usage description in `Info.plist`:
        ```dart 
        <key>NSCameraUsageDescription</key>
        <string>Camera permission is required for barcode scanning.</string>
        ```
    - To use this scanner, you need to import the package first.
    ```dart
    import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
    ```
    - One time scan:
    ```dart 
     String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    COLOR_CODE, 
                                                    CANCEL_BUTTON_TEXT, 
                                                    isShowFlashIcon, 
                                                    scanMode,
                                         );
      ```
    Here in `scanBarcode`,
    `COLOR_CODE` is hex-color which is the color of line in barcode overlay you can pass color of your choice,
    `CANCEL_BUTTON_TEXT` is a text of cancel button on screen you can pass text of your choice and language,
    `isShowFlashIcon` is bool value used to show or hide the flash icon,
    `scanMode` is a enum in which user can pass any of `{ QR, BARCODE, DEFAULT }`, if nothing is passed it will consider a default value which will be `QR`. It shows the graphics overlay like for barcode and QR.
    - Continuous scan:
    If you need to scan barcodes continuously without closing camera use `FlutterBarcodeScanner.getBarcodeStreamReceiver` params will be same like `FlutterBarcodeScanner.scanBarcode` e.g.
    ```dart 
     FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)
     .listen((barcode) {
      /// barcode to be used
      });
    ```
    - `scanBarcodeNormal()` method:
    ```dart

      Future<void> scanBarcodeNormal() async {
   String barcodeScanRes;
   // Platform messages may fail, so we use a try/catch PlatformException.
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

   // If the widget was removed from the tree while the asynchronous platform
   // message was in flight, we want to discard the reply rather than calling
   // setState to update our non-existent appearance.
   if (!mounted) return;

   setState(() {
   _scanBarcode = barcodeScanRes;
   });
   }
    ```
    - `scanQR()` method:
    ```dart
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
      _scanBarcode = barcodeScanRes;
      });
      }
    ```
    - `startBarcodeScanStream()` method:
    ```dart
    Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
    '#ff6666',
    'Cancel',
    true,
    ScanMode.BARCODE,
    )!
    .listen(
    (barcode) => debugPrint(barcode),
    );
    }
    ```
        