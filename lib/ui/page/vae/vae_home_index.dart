import 'package:flutter/material.dart';
import 'package:flutter_vaehome/ui/widget/MyUnderlineTabindicator.dart';

class VaeHomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VaeHomeScreenState();
  }
}

class VaeHomeScreenState extends State<VaeHomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;
  List tabs = ['动态', '行程', '活动'];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              primary: true,
              forceElevated: false,
              automaticallyImplyLeading: true,
              titleSpacing: NavigationToolbar.kMiddleSpacing,
              snap: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 0),
                title: new TabBar(
                    tabs:tabs.map((e)=>Tab(text: e,)).toList(),
                  controller: _tabController,
                  indicator: MyUnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0,color: Colors.lightBlue)
                  ),
                  labelColor: Colors.lightBlue,
                  unselectedLabelColor: Colors.black26,
                  labelStyle: TextStyle(fontSize: 15),
                ),
              ),
            )
          ];
        },
        body: new TabBarView(
          children: <Widget>[
            Text('1'),
            Text('2'),
            Text('3'),
          ],controller: _tabController,
        )
    );
  }
}