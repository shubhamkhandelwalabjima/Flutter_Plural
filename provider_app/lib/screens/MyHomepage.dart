import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider_app/Widgets/CustomAppBar.dart';
import 'package:provider_app/Widgets/Drawer.dart';
import 'package:provider_app/screens/StartUp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _colorTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.pink)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 120, 50, 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromARGB(255, 79, 78, 78),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "Streak",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("Books Read",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("115",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("Minutes",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Books For All",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Startup(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 175,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://th.bing.com/th/id/OIP.wJQUMOYcJjuYBN9Oem1bTwHaEK?pid=ImgDet&rs=1"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://th.bing.com/th/id/OIP.mqzgdb5nsuo02TDvYlHz4QHaE6?pid=ImgDet&rs=1"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://th.bing.com/th/id/OIP.mqzgdb5nsuo02TDvYlHz4QHaE6?pid=ImgDet&rs=1"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Books For Students",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://th.bing.com/th/id/OIP.mqzgdb5nsuo02TDvYlHz4QHaE6?pid=ImgDet&rs=1"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://th.bing.com/th/id/OIP.mqzgdb5nsuo02TDvYlHz4QHaE6?pid=ImgDet&rs=1"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://th.bing.com/th/id/OIP.mqzgdb5nsuo02TDvYlHz4QHaE6?pid=ImgDet&rs=1"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Time: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                      animationController: _animationController,
                      colorsTween: _colorTween,
                      drawerTween: _drawerTween,
                      homeTween: _homeTween,
                      iconTween: _iconTween,
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      yogaTween: _yogaTween)
                ],
              ),
            ),
          ],
        ),
        onNotification: scrollListner,
      ),
    );
  }
}