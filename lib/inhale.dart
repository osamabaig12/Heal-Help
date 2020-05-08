import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

void main() => runApp(MaterialApp(
      home: MyInhale(),
      theme: ThemeData(
        //canvasColor: Color(0xff51c8c3),
        //canvasColor: Color(0xff51c8c3),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        //accentColor: Color(0xff63EAE4),
        brightness: Brightness.dark,
      ),
    ));

class MyInhale extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyInhale> with TickerProviderStateMixin {
  AnimationController controller;
  int _curIndex = 0;
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds).toString()}';
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: Color.fromRGBO(81, 200, 196, 1.0),
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "INHALE",
                              style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize:  50 , fontWeight: FontWeight.bold),
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize:  90),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(6.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
                    child: AnimatedBuilder(
                      animation: controller,

                      builder: (BuildContext context, Widget child) {
                        return Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);

                      },
                    ),
                    onPressed: () {

                      route(){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => MyExhale()
                        )
                        );
                      };
                      startTime() async {
                        var duration = new Duration(seconds: 4);
                        return new Timer(duration, route);
                      };
                      startTime();

                      if (controller.isAnimating) {
                        controller.stop(canceled: true);

                      } else {

                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class MyExhale extends StatefulWidget {
  @override
  MyExhaleState createState() => MyExhaleState();
}

class MyExhaleState extends State<MyExhale> with TickerProviderStateMixin {
  AnimationController controller;
  int _curIndex = 0;
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds).toString()}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: Color.fromRGBO(81, 200, 196, 1.0),
                                ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "EXHALE",
                              style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize:  50 , fontWeight: FontWeight.bold),
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize:  90),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor:Color.fromRGBO(81, 200, 196, 1.0),
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);

                      },
                    ),
                    onPressed: () {

                      route(){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => MyInhale()
                        )
                        );
                      };
                      startTime() async {
                        var duration = new Duration(seconds: 5);
                        return new Timer(duration, route);
                      };
                      startTime();

                      if (controller.isAnimating) {
                        controller.stop(canceled: true);

                      } else {

                        controller.reverse(
                            from: controller.value == 0.0
                                ?
                            1.0: controller.value);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width/ 2, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
