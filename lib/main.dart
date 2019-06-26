import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Top.pageName: (_) => Top(),
        Detail.pageName: (_) => Detail(),
        Home.pageName: (_) => Home(),
        Message.pageName: (_) => Message(),
        Profile.pageName: (_) => Profile(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Bottom Navigator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _children;
  RouteFactory _onGenerateRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onGenerateRoute =
        (context.ancestorWidgetOfExactType(Navigator) as Navigator)
            .onGenerateRoute;

    _children = [
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Home.pageName,
        onGenerateRoute: _onGenerateRoute,
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Message.pageName,
        onGenerateRoute: _onGenerateRoute,
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Profile.pageName,
        onGenerateRoute: _onGenerateRoute,
      ),
//      Top(tabName: "Home"),
//      Top(tabName: "Message"),
//      Top(tabName: "Profile"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Top extends StatelessWidget {
  static final String pageName = "top";
  final String tabName;
  Top({this.tabName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(tabName),
            FlatButton(
              child: Text("Go to detail"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Detail(prefixStr: tabName);
                }));
              },
            ),
          ],
        ),
      ),
    );
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
                Navigator.of(context)
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
