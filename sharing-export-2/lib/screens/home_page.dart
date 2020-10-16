import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import '../widgets/quote_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // для отображения спиннера на кнопке (true) либо текста (false)
  bool button1, button2;

  // ключ
  static GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    button1 = false;
    button2 = false;
    super.initState();
  }

  // Собственно функция для снятия скриншота с виджета, обернутого в RapainBoundary
  Future<Null> shareScreenshot() async {
    // включить спиннер
    setState(() {
      button1 = true;
    });
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => shareScreenshot());
        return null;
      }
      ui.Image image = await boundary.toImage(pixelRatio: 5);
      final directory = (await getExternalStorageDirectory()).path;
      ByteData byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/pic.png');
      imgFile.writeAsBytes(pngBytes);
      final RenderBox box = context.findRenderObject();
      Share.shareFiles(['$directory/pic.png'],
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
    setState(() {
      button1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Sharing File"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.orange,
          ),
          RepaintBoundary(
            key: _globalKey,
            child: QuoteCard(
              quote: 'Some inspiring text',
              author: 'Some bullshit',
              backgroundImage: 'images/8.jpg',
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: RaisedButton(
              color: Colors.blueAccent[100],
              onPressed: shareScreenshot,
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                // отображаем текст либо прогрессбар
                child: button1
                    ? CircularProgressIndicator()
                    : Text(
                        'Share Screenshot',
                        style: TextStyle(fontSize: 17),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
