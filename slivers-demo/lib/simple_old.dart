import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Simple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    // формируем лист для отображения
    List<Widget> _containersList = [];

    for (int i = 1; i < 10; i++) {
      _containersList.add(Container(
        color: _randomColor.randomColor(),
        height: 150.0,
      ));
    }

    return Container(
      // основной виджет для сливеров
      child: CustomScrollView(
        slivers: <Widget>[
          // аппбар внутри
          SliverAppBar(
            // floating: true - бар будет появляться при любом перемещении списка вниз
            // floating: true,
            title: Text('SliverAppBar'),
            pinned: true,
            backgroundColor: Colors.grey,
            // первоначальная высота
            expandedHeight: 200.0,
            // раскрывающийся бар
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://sun9-56.userapi.com/impf/chVBNMmw-Yy4abi92bkAinBgCIIo4nP_SQ691g/BjEttsBQTX4.jpg'
                  '?size=1054x700&quality=96&proxy=1&sign=7402e6971ff5004681e16f631e3fb066&type=album',
                  fit: BoxFit.cover),
            ),
          ),
          // лист сливеров
          SliverList(
            // Child Builder - "ленивое" постреоние списка
            delegate: SliverChildBuilderDelegate(
              // управление через index
              (BuildContext context, int index) {
                return _containersList[index];
              },
              // кол-во элементов
              childCount: _containersList.length,
            ),
          ),
          SliverAppBar(
            // floating: true - бар будет появляться при любом перемещении списка вниз
            // floating: true,
            title: Text('SliverAppBar 2 yo'),
            // pinned - бар будет запинен сверху при сролле
            pinned: true,
            backgroundColor: Colors.red,
            // первоначальная высота
            expandedHeight: 200.0,
            // раскрывающийся бар
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://sun9-56.userapi.com/impf/chVBNMmw-Yy4abi92bkAinBgCIIo4nP_SQ691g/BjEttsBQTX4.jpg'
                  '?size=1054x700&quality=96&proxy=1&sign=7402e6971ff5004681e16f631e3fb066&type=album',
                  fit: BoxFit.cover),
            ),
          ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   floating: false,
          //   delegate: Delegate(Colors.red, "I am pinned yo"),
          // ),
          SliverList(
            // Child Builder - "ленивое" постреоние списка
            delegate: SliverChildBuilderDelegate(
              // управление через index
              (BuildContext context, int index) {
                return _containersList[index];
              },
              // кол-во элементов
              childCount: _containersList.length,
            ),
          ),
        ],
      ),
    );
  }
}
