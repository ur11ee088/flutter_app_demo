import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController mTabsControl;

  @override
  void initState() {
    super.initState();
    mTabsControl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    mTabsControl.dispose();
  }

  List<Widget> mGetItems() {
    List<Card> cards = [];
    for (int i = 1; i <= 40; i++) {
      cards.add(Card(
        margin: EdgeInsets.all(6.0),
        elevation: 3,
        shadowColor: Colors.black45,
        color: Colors.white,
        child: ListTile(
          title: Text('Card $i'),
        ),
      ));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: TabBarView(
          controller: mTabsControl,
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  expandedHeight: 190.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'My Demo App',
                      style: TextStyle(color: Colors.black),
                    ),
                    background: Image.asset('assets/images/sbi.jpg'),
                    centerTitle: true,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(mGetItems()),
                )
              ],
            ),
            TopTabBar(),
            Center(
                child: Text(
              'profile',
              style: TextStyle(fontSize: 30.0, color: Colors.deepOrange),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.deepOrange,
        child: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0)),
          controller: mTabsControl,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.shop),
              text: 'Play',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}

class TopTabBar extends StatefulWidget {
  TopTabBar({Key key}) : super(key: key);

  @override
  _TopStateTabBar createState() => _TopStateTabBar();
}

class _TopStateTabBar extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test App Demo'),
        centerTitle: true,
      ),
      body: Scaffold(
          appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.deepOrange,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0)),
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "All"),
            Tab(
              text: "Paid",
            ),
            Tab(
              text: "History",
            ),
          ],
        ),
      )),
    );
  }
}
