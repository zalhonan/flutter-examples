import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Simple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    // контроллер для перехода по списку
    ScrollController _controller = ScrollController();

    // формируем лист для отображения
    List<Widget> _containersList = [];

    for (int i = 1; i < 10; i++) {
      _containersList.add(Container(
        color: _randomColor.randomColor(),
        height: 150.0,
      ));
    }

    // вероятно, костыльный вариант - считаем в пикселях точную позицию аппбара
    double _index1 = 0;
    double _index2 = ((_containersList.length + 1) * 150).toDouble();
    double _index3 = (_index2 + (_containersList.length + 1) * 150).toDouble();

    return Container(
      // основной виджет для сливеров
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          // аппбар внутри. передаём контролер и расчетный индекс
          ExpandableAppBar(
            controller: _controller,
            title: "app bar one yo",
            index: _index1,
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
          ExpandableAppBar(
            controller: _controller,
            title: "app bar TWO yo",
            index: _index2,
            // index: _controller.position.pixels
          ),

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

          ExpandableAppBar(
            controller: _controller,
            title: "app bar THREE yo",
            index: _index3,
          ),

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

class ExpandableAppBar extends StatelessWidget {
  ExpandableAppBar({this.controller, this.title, this.index});

  final ScrollController controller;
  final String title;
  final double index;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // floating: true - бар будет появляться при любом перемещении списка вниз
      // floating: true,
      title: GestureDetector(
          onTap: () {
            // отдельно для заголовка и для всего остального бара
            jumpHere(index, controller);
          },
          child: Text(title)),
      // pinned - остается запиненным при скролле
      pinned: true,
      backgroundColor: Colors.grey,
      // первоначальная высота
      expandedHeight: 200.0,
      // раскрывающийся бар с картинкой
      flexibleSpace: GestureDetector(
        onTap: () {
          jumpHere(index, controller);
        },
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Image.network(
              'https://sun9-56.userapi.com/impf/chVBNMmw-Yy4abi92bkAinBgCIIo4nP_SQ691g/BjEttsBQTX4.jpg'
              '?size=1054x700&quality=96&proxy=1&sign=7402e6971ff5004681e16f631e3fb066&type=album',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

void jumpHere(double index, ScrollController controller) {
  controller.animateTo(index,
      duration: Duration(milliseconds: 1000), curve: Curves.ease);
}
