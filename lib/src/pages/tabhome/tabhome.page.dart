import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodcleandesign/src/bloc/tabhome.bloc.dart';

import '../pages.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  TabHomeBloc _tabBloc;

  @override
  void initState() {
    _tabBloc = TabHomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _tabBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Widget _getPage() => StreamBuilder(
      stream: _tabBloc.indexTabFlux,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var position = snapshot.hasData ? snapshot.data : 0;

        switch (position) {
          case 0:
            return HomePage();
            break;
          case 1:
            return UserRecipes();
            break;
          case 2:
            return CheckoutPage();
            break;
          case 3:
            return ProfilePage();
            break;
          default:
            return HomePage();
            break;
        }
      });

  BottomNavigationBarItem _getBottoNavigationBar(Icon icon, Widget item) =>
      BottomNavigationBarItem(
        icon: Container(
          height: 35,
          decoration: new BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: new BorderRadius.all(Radius.elliptical(50, 50)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[icon, item],
          ),
        ),
        title: Text(
          '',
          style: TextStyle(fontSize: 1),
        ),
      );

  Widget _getBottomNavigationBar() {
    return StreamBuilder(
        stream: _tabBloc.indexTabFlux,
        initialData: 1,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var index = snapshot.hasData ? snapshot.data : 0;
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              index == 0
                  ? _getBottoNavigationBar(
                      Icon(
                        AntDesign.getIconData("home"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 8, right: 8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'robotic',
                                  color: Color(0xFF5A9785),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: Icon(
                        AntDesign.getIconData("home"),
                        color: Colors.black,
                      ),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 1),
                      ),
                    ),
              index == 1
                  ? _getBottoNavigationBar(
                      Icon(
                        Feather.getIconData("flag"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'User',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'robotic',
                                  color: Color(0xFF469469),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Recipie',
                                style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'robotic',
                                    color: Color(0xFF5A9785),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: Icon(
                        Feather.getIconData("flag"),
                        color: Colors.black,
                      ),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 1),
                      ),
                    ),
              index == 2
                  ? _getBottoNavigationBar(
                      Icon(
                        AntDesign.getIconData("Safety"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 8, right: 8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Check In',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'robotic',
                                  color: Color(0xFF5A9785),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                  : BottomNavigationBarItem(
                      icon: Icon(
                        AntDesign.getIconData("Safety"),
                        color: Colors.black,
                      ),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 1),
                      ),
                    ),
              index == 3
                  ? BottomNavigationBarItem(
                      icon: Container(
                        height: 35,
                        decoration: new BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius:
                              new BorderRadius.all(Radius.elliptical(50, 50)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            'assets/img/avatar.png')))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 8, right: 8),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'robotic',
                                        color: Color(0xFF5A9785),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 1),
                      ),
                    )
                  : BottomNavigationBarItem(
                      icon: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'assets/img/avatar.png')))),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 1),
                      ),
                    ),
            ],
            currentIndex: index,
            selectedItemColor: Color(0xFF5A9785),
            onTap: (index) {
              _tabBloc.indexTabEvent.add(index);
            },
          );
        });
  }
}
