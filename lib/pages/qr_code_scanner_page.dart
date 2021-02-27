import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washbox/views/qr_code_scanner_view.dart';

class QRCodeScannerPage extends StatelessWidget {

  const QRCodeScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     /* MultiBlocProvider(
      providers: [
      ],
      child: */
      QRCodeScannerView();
   //   ,);
  }
}