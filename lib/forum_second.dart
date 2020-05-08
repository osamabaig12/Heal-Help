import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'forum_first.dart';
void main()
{
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationBar(),
    );
  }
}
class ForumDetailPage extends StatelessWidget {
  int current_index = 0;
  String post = '';
  final List<Widget> children = [];
  final _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return new Scaffold(

      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
        "heal&help",
        textScaleFactor: 1.3,
    ),
    ),
     body: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {

      return SingleChildScrollView(
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: viewportConstraints.maxHeight,
    ),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
         Container(
           padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
                 Text("Create a Post", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 200, 196, 1.0), fontSize:
                 35.0), )
               ],
           ),
         ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
            height: 100.0,
            width: queryData.size.width/3,
            padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Color.fromRGBO(81, 200, 196, 1.0),
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {Navigator.pushNamed(context, '/forum');},
                  child: Center(
                    child: Text(
                      'back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),

          ),
          SizedBox(width: queryData.size.width/3),
                Container(
                  height: 100.0,
                  width: queryData.size.width/3,
                  padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Color.fromRGBO(81, 200, 196, 1.0),
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {

                        Navigator.pushNamed(context, '/forum');
                      },
                      child: Center(
                        child: Text(
                          'post',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),

                )
              ]
                ),
               /*Container(

                    padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.minimize),
                        iconSize: 100,
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/forum');
                        },
                      )
                    ],
                              ),
                      ),*/
               Row(
                 children: <Widget>[
                   Image(
                       image: AssetImage('lib/se/icons8-male-user-150.png'),
                       height: 50,

                   ),
                   SizedBox(width: queryData.size.width/20),
                   Text(
                     'R. Van Persie',
                     style: TextStyle(
                         color: Color.fromRGBO(81, 200, 196, 1.0),
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         fontFamily: 'Montserrat'),
                   ),
                 ],
               ),
               SizedBox(height: 20.0,),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: queryData.size.width/20),
    Container(
                   height: queryData.size.height/5,
                   width: queryData.size.width/1.1225,
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.blueAccent)
                   ),
                   child:  Form(
                 key: _formKey,

                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: <Widget>[
                  TextFormField(

                    style:TextStyle(
                        fontSize: 20.0,
                        height: 3.0,

                        color: Colors.black
                    ),
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    contentPadding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                    border: InputBorder.none,
                    hintText: 'Please type in your post here',

    ),
                    validator: (value) {
                  if (value.isEmpty) {
                  return 'Please enter some text';
                  }
                  else{
                    post = value;
                    return null;
                  }
    },
    ),

    ],
    ),
                   )
                   ),
              SizedBox(width: queryData.size.width/20)
           ]
               ),

               ] ),
       )
    );
  }
    ),

/*
     bottomNavigationBar: BottomNavigationBar(
         onTap: ,
         type: BottomNavigationBarType.fixed,
         backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
    //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
         items:
    [
    BottomNavigationBarItem(

    icon: Icon(Icons.home),
    title: Text('Home'),
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.white,size: 60,),
        title: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        title: Text('Business'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        title: Text('School'),
      ),
    ]
    )
*/

    );
  }
}
/*
class BottomNavigationBar extends StatefulWidget {


  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}



class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          onTap: ,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          items:
          [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,size: 60,),
              title: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ]
      )
      ],
    ),);
  }
}*/
