import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../widgets/quote_card.dart';
import '../widgets/widget_to_image.dart';
import '../services/utils.dart';
import '../widgets/build_image.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class CardsList extends StatefulWidget {
  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  // ключ служит для поиска виджета
  GlobalKey key1;

  // сюда записываем картинку
  Uint8List bytes1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar here'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // оборачиваем виджет в новый WidgetToImage
                WidgetToImage(
                  // конвертируем билдер в block body, чтобы передать key
                  builder: (key) {
                    this.key1 = key;
                    return QuoteCard(
                      quote: 'quote here',
                      author: 'Author here',
                      backgroundImage: 'images/4.jpg',
                    );
                  },
                ),
                Container(
                  height: 10,
                ),
                buildImage(bytes1),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('Copy card as png'),
                      onPressed: () async {
                        print('button copy pressed');
                        final bytes1 = await Utils.capture(key1);

                        // обновляем стейт, чтобы отобразить картинку. Она теперь в this.bytes1
                        setState(() {
                          this.bytes1 = bytes1;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('share image'),
                      onPressed: () async {
                        print('button share pressed');

                        // расшар jpg. Первые два параметра - тайтл и название файла. Разрешений не требуется
                        await Share.file(
                            'Quote', 'quote.jpg', this.bytes1, 'image/jpg');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
