import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        accentColor: Colors.green,
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
      body: CustomScrollView(
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
      bottomNavigationBar: Container(
        color: Colors.green,
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
