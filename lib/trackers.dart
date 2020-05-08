import 'package:flutter/material.dart';
import 'login_actual.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heal&Help',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyTrackers(title: 'Heal&Help'),
    );
  }
}

class MyTrackers extends StatefulWidget {
  MyTrackers({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyTrackers> {
 int _counter = counter;
  int _curIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      counter = _counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter > 0) {
        _counter--;
        counter = _counter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RawMaterialButton(onPressed: _incrementCounter,

              child: Icon(Icons.add, color: Colors.white,),
                        fillColor: Color.fromRGBO(81, 200, 196, 1.0),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30,),
              child: Text(
                _counter < 8 ? 'You have had $_counter glasses of water' : 'Good Job! Water requirement met',
               // 'You have had $_counter glasses of water',
                style: TextStyle(color: Colors.cyan, fontSize: 25,),
              )
              ),
            
            new RawMaterialButton(onPressed: _decrementCounter,
                        child: Icon(Icons.remove, color: Colors.white,),
                        fillColor: Color.fromRGBO(81, 200, 196, 1.0),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
          ],
        ),
      ),
        bottomNavigationBar:
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          items:
          [
            BottomNavigationBarItem(
              icon: new Icon(Icons.spa,color: Colors.white,size: 50,),
              title: Text(' '),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_florist,color: Colors.white,size: 50,),
              title: Text(' '),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_drink,color: Colors.white,size: 50,),
              title: Text(' '),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home,color: Colors.white,size: 50,),
              title: Text(' '),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.message,color: Colors.white,size: 50,),
              title: Text(' ',),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings,color: Colors.white,size: 50,),
              title: Text(' '),
            ),
          ],
          currentIndex: _curIndex,
          onTap: (index) {
            setState(() {
              _curIndex = index;
              switch (_curIndex) {
                case 0:
                  Navigator.of(context).pushNamed('/inhale');
                  break;
                case 1:
                  Navigator.of(context).pushNamed('/period');
                  break;
                case 2:
                  Navigator.of(context).pushNamed('/trackers');
                  break;
                case 3:
                  Navigator.of(context).pushNamed('/forum');
                  break;
                case 4:
                  Navigator.of(context).pushNamed('/chat');
                  break;
                case 5:
                  Navigator.of(context).pushNamed('/settings');
                  break;

              }
            });
          },
        ),
    );
  }
}
