import 'package:flutter/material.dart';
import 'package:flutter_vaehome/ui/widget/MyUnderlineTabindicator.dart';
import 'package:flutter_vaehome/ui/pages/group/vae_group_all.dart';
import 'package:flutter_vaehome/ui/pages/group/vae_group_hot.dart';
import 'package:flutter_vaehome/ui/pages/group/vae_group_follow.dart';

class VaeGroupScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VaeGroupScreenState();
  }
}

class VaeGroupScreenState extends State<VaeGroupScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
//  ScrollController _scrollController;
  List tabs = ['广场', '热门', '关注'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
//    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    bool showRed = true;
    Map showRed = {'广场':false, '热门':true, '关注':false};

    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search,size: 28,color: Colors.lightBlueAccent,), onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit,size: 28,color: Colors.lightBlueAccent,), onPressed: (){},
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          title: Padding(padding: EdgeInsets.only(left: 50,right: 50),
          child: TabBar(
            tabs: tabs.map((e)=>Tab(child: CustomPaint(
              painter: showRed[e] ? _RoundPaint() : null,
              child: Text(e,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
            ),)).toList(),
            controller: _tabController,
            indicator: MyUnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.lightBlue)
            ),
            labelColor: Colors.lightBlue,
            unselectedLabelColor: Colors.black54,
            labelStyle: TextStyle(fontSize: 16),
          ),)
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          GroupAllScreen(),
          GroupHotScreen(),
          GroupFollowScreen()
//        children: [
//          MediaQuery.removePadding(removeTop: true,context: context, child: VaeTrackScreen()),
//          MediaQuery.removePadding(removeTop: true,context: context, child: VaeScheduleScreen()),
//          MediaQuery.removePadding(removeTop: true,context: context, child: VaePartyScreen()),
        ],
        controller: _tabController,),
    );
  }
}

class _RoundPaint extends CustomPainter {
  // 画红点
  Paint _paint = new Paint()
    ..color = Colors.red
    ..strokeWidth = 1
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawCircle(
        Offset(35.0, 0.0),
        4.0,
        _paint
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}