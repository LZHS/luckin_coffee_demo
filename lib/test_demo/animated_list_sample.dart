import 'dart:math';

import 'package:flutter/material.dart';

///AnimatedList显示与ListModel保持同步的卡片列表。当新的item被添加到ListModel或从ListModel中删除时，相应的卡片在UI上也会被添加或删除，并伴有动画效果。
class AnimatedListSample extends StatefulWidget {
  AnimatedListSample({Key key}) : super(key: key);

  @override
  _AnimatedListSampleState createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel(
        listKey: _listKey,
        initialItems: <int>[0, 1, 2],
        removedItemBuilder: _buildRemovedItem);
    _nextItem = 3;
  }

  CardItem _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
    );
  }

  CardItem _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectItem == _list[index],
      onTap: () {
        setState(() {
          _selectItem = _selectItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: _insert,
            tooltip: "添加 新 Item ",
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: _remove,
            tooltip: "删除 已有 Item ",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.lenght,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

  _remove() {
    if (_selectItem != null) {
      _list.removeAt(_list.indexOf(_selectItem));
      setState(() {
        _selectItem = null;
      });
    }
  }

  _insert() {
    final int index =
        _selectItem == null ? _list.lenght : _list.indexOf(_selectItem);
    _list.insert(index, _nextItem++);
  }
}

class ListModel<T> {
  final GlobalKey<AnimatedListState> listKey;

  final Widget Function(
          T item, BuildContext context, Animation<double> animation)
      removedItemBuilder;

  final List<T> _items;

  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<T> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = initialItems?.toList() ?? <T>[];

  AnimatedListState get _animatedList => listKey.currentState;

  int get lenght => _items.length;

  T operator [](int index) => _items[index];

  int indexOf(T item) => _items.indexOf(item);

  void insert(int index, T element) {
    _items.insert(index, element);
    _animatedList.insertItem(index);
  }

  T removeAt(int index) {
    final T removeItem = _items.removeAt(index);
    if (removeItem != null)
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removeItem, context, animation);
      });
    return removeItem;
  }
}

class CardItem extends StatelessWidget {
  final Animation<double> animation;

  final int item;

  final VoidCallback onTap;

  final bool selected;

  CardItem({
    Key key,
    @required this.animation,
    @required this.item,
    this.onTap,
    this.selected = false,
  })  : assert(animation != null),
        assert(item != null && item >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[300]);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 128.0,
            child: Card(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Center(
                child: Text(
                  "Item : $item",
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
