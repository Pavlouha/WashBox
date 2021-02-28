import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:washbox/other/colors.dart';
import 'package:washbox/other/borders.dart';

class QRCodeScannerView extends StatefulWidget {
  const QRCodeScannerView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeScannerViewState();
}

class _QRCodeScannerViewState extends State<QRCodeScannerView> {
  //TODO блок, мэйби даже как-то поток сразу туда перекидывать, я хз
  Barcode result;
  QRViewController controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  //  Из документации к библиотеке: In order to get hot reload to work we need to pause the camera if the platform
  // is Android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
       floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: FloatingActionButton(
      backgroundColor: buttonColor,
    child: const Icon(Icons.keyboard_hide_outlined),
    onPressed: () {
      showDialog<void>(context: context, builder: (context) => _showDialog());
    },
    ),
    ),]),
       body: Column(
          children: <Widget>[
            Expanded(flex: 16, child: _buildQrView(context)),
            Expanded(
              flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (result != null)
                          Text(
                              'Тип: ${describeEnum(result.format)} Данные: ${result.code}')
                        else
                          Text('Отсканируйте код', style: TextStyle(color: inputTextColor, fontSize: 18)),
                      ],
                    ),

              ),

          ],
        ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400) ? 250.0 : 400.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: backgroundColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _showDialog() {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text('Введите код, указанный на машине', style: TextStyle(color: inputTextColor),),
      content: Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child:
                 TextFormField(
                  textInputAction: TextInputAction.done,
                 // focusNode: focusNode,
                  decoration: InputDecoration(
                      enabledBorder: inputBorder(radius: 20),
                      focusedBorder: inputBorder(radius: 20),
                      fillColor: inputTextColor,
                      filled: true),
                  onChanged: (value) {
                  },
        ),
      ),
      actions: [
      TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Отмена', style: TextStyle(fontSize: 18, color: inputTextColor)),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Далее', style: TextStyle(fontSize: 18, color: inputTextColor)),
        ),
      ],
    );
  }
}