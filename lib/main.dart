import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Detail.pageName: (_) => Detail(),
        Home.pageName: (_) => Home(),
        Message.pageName: (_) => Message(),
        Profile.pageName: (_) => Profile(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Bottom Navigator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _children;
  RouteFactory _onGenerateRoute;

  final Map<int, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home.index: GlobalKey<NavigatorState>(),
    TabItem.message.index: GlobalKey<NavigatorState>(),
    TabItem.profile.index: GlobalKey<NavigatorState>(),
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onGenerateRoute =
        (context.ancestorWidgetOfExactType(Navigator) as Navigator)
            .onGenerateRoute;

    _children = [
//      Navigator(
//        key: _navigatorKeys[TabItem.home.index],
//        initialRoute: Home.pageName,
//        onGenerateRoute: _onGenerateRoute,
//      ),
//      Navigator(
//        key: _navigatorKeys[TabItem.message.index],
//        initialRoute: Message.pageName,
//        onGenerateRoute: _onGenerateRoute,
//      ),
//      Navigator(
//        key: _navigatorKeys[TabItem.profile.index],
//        initialRoute: Profile.pageName,
//        onGenerateRoute: _onGenerateRoute,
//      ),
      Home(),
      Message(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _buildBodyStack(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }

  _buildBodyStack() {
    return Stack(
      children: <Widget>[
        Visibility(
          maintainState: true,
          visible: _currentIndex == 0,
          child: Navigator(
            key: _navigatorKeys[TabItem.home.index],
            initialRoute: Home.pageName,
            onGenerateRoute: _onGenerateRoute,
          ),
        ),
        Visibility(
          maintainState: true,
          visible: _currentIndex == 1,
          child: Navigator(
            key: _navigatorKeys[TabItem.message.index],
            initialRoute: Message.pageName,
            onGenerateRoute: _onGenerateRoute,
          ),
        ),
        Visibility(
          maintainState: true,
          visible: _currentIndex == 2,
          child: Navigator(
            key: _navigatorKeys[TabItem.profile.index],
            initialRoute: Profile.pageName,
            onGenerateRoute: _onGenerateRoute,
          ),
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Home extends StatelessWidget {
  static final String pageName = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Home"),
            FlatButton(
              child: Text("Go to detail"),
              onPressed: () {
                Navigator.of(context) // rootNavigator: rootNavigator
                    .push(MaterialPageRoute(builder: (context) {
                  return Detail(prefixStr: "Home");
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  static final String pageName = "message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Message"),
            FlatButton(
              child: Text("Go to detail"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Detail(prefixStr: "Message");
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  static final String pageName = "profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Profile"),
            FlatButton(
              child: Text("Go to detail"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Detail(prefixStr: "Profile");
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  static final String pageName = "detail";
  final String prefixStr;
  Detail({this.prefixStr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(child: Text("$prefixStr Detail")),
    );
  }
}

enum TabItem {
  home,
  message,
  profile,
}
