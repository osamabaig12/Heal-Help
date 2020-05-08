import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/category_selector.dart';
//import 'package:flutter_chat_ui/widgets/favorite_contacts.dart';
import 'widgets/recent_chats.dart';
import 'models/message_model.dart';

void main() => runApp(MyChat());

class MyChat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(81, 200, 196, 1.0),
        accentColor: Colors.white,
      ),
      home: new HomeScreen(),

    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _curIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'messenger',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        //elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
          children: <Widget> [
            CategorySelector(),
            RecentChats(),
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        items:
        [
          BottomNavigationBarItem(
            icon: new Icon(Icons.spa,color: Colors.white,size: 50,),
            title: Text(' ',style: TextStyle(color: _curIndex == 0 ? Colors.white : Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart,color: Colors.white,size: 50,),
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
                Navigator.of(context).pushNamed('/login');
                break;
              case 2:
                Navigator.of(context).pushNamed('/forum');
                break;
              case 3:
                Navigator.of(context).pushNamed('/chat');
                break;
              case 4:
                Navigator.of(context).pushNamed('/inhale');
                break;
            }
          });
        },
      ),
    );
  }
}