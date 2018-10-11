### Flutter 常用组件
```dart
new DropdownButton(
  items: [
    new DropdownMenuItem(
      child: Text("a"),
      value: 1,
    ),
  ], // 下拉的选项
  onChanged: (value) => print(value),
  isExpanded: false, // 是否扩展到父级同宽
  isDense: false, // 是否为迷你大小
  hint: Text("全部"), // value与items.value不匹配时的展示项
  elevation: 24, // 阴影大小
  iconSize: 36.0,
  value: 1, // 默认显示的items的value
  style: new TextStyle(fontSize: 18.0, color: Colors.red),
)
```

```dart
// 部分属性暂时未测出效果
new AppBar(
  leading: IconButton(
    icon: Icon(Icons.menu, color: Colors.white,),
    tooltip: 'Navigation menu',
    onPressed: null,
  ), // 左侧要显示的部件
  elevation: 16.0, // 阴影大小
  automaticallyImplyLeading: true, // 意义不大
  backgroundColor: Colors.lightGreen,
  title: Text('Example title'),
  centerTitle: true, // title是否居中显示
  iconTheme: IconThemeData(
    opacity: 1.0,
    color: Colors.redAccent, // 无效
    size: 90.0 // 无效
  ),
  brightness: Brightness.light, // status bar的主题
  titleSpacing: 20.0,
  primary: true, // 是否被statusbar遮挡
  toolbarOpacity: 0.3,
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(36.0), // AppBar的高度
    child: Container(
      alignment: Alignment.center,
      height: 48.0,
      child: Text("hahh"),
    ), // bottom 底部延伸
  ),
  bottomOpacity: 0.3,
  textTheme: TextTheme(),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search, color: Colors.white,),
      tooltip: 'Search',
      onPressed: null,
    ),
  ], // 右侧的多个部件
)
```

```dart
// 常用属性
ListView.builder(
  itemBuilder: (BuildContext context, int i) =>
    new Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text("content $i"),
    ), // 生成器
  itemCount: 30, // 数量
  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
  scrollDirection: Axis.vertical, // 滑动的方向
  primary: false,
  itemExtent: 50.0, // item的高度
  shrinkWrap: false,
  reverse: true, // 是否反转展示
  controller: ScrollController(
    initialScrollOffset: 200.0 // 初始滚动到的位置
  ),
  physics: const AlwaysScrollableScrollPhysics(), // 当内容不够一页时也允许滚动
  cacheExtent: 50.0, // 缓冲区的高度
)
```

```dart
PopupMenuButton<Choice>(
  onSelected: _select,
  // icon: Icon(Icons.account_box), // icon 和 child目前二选一
  child: IconButton(icon: Icon(Icons.access_time), onPressed: null,),
  initialValue: choices[4], // 默认选中第几项
  itemBuilder: (BuildContext context) { // 返回PopupMenuItem类型的List<widget>
    return choices.skip(2).map((Choice choice) {
      return PopupMenuItem<Choice>(
        value: choice, // value值
        child: Text(choice.title),
        height: 36.0,
        enabled: false, // 是否可选择
      );
    }).toList();
  },
)
```

```dart
// 可下拉展开的列表
ExpansionTile(
  title: Text(root.title), // 标题
  children: Widget[], // 展开项
  initiallyExpanded: true, // 是否默认展开
  trailing: Icon(Icons.rotate_right), // 尾部Widget
  leading: Icon(Icons.rotate_left), // 头部Widget
  backgroundColor: Color(Icons.red),
  onExpansionChanged: (bool b) {},
)
```

```dart
DefaultTabController(
  length: choices.length,
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Tabbed AppBar'),
      bottom: TabBar(
        controller: controller,
        isScrollable: true, // 是否可左右滚动
        indicator: new ShapeDecoration(shape: new Border.all(color: Colors.redAccent, width: 1.0)), // 指示器的形状， 默认为下划线
        indicatorSize: TabBarIndicatorSize.label, // 宽度与label或者tab同宽
        // 其他属性
        tabs: <Widget>[
          Tab(text: "label", icon: Icon(Icons.camera),)
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[],
    ),
  ),
)
// TabBar可以通过DefaultTabController与TabBarView联系在一起
// 也可以通过与TabBarView的controler公用达到目的
```
