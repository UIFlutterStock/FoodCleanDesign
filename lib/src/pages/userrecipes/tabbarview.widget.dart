import 'package:flutter/material.dart';

Widget getTabBar(TabController tabController) => Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TabBar(
        controller: tabController,
        indicatorColor: Color(0xFF5A9785),
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Text(
              'Recipes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Gallery',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Story',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );

Widget getCard(String imgPath, String foodName) {
  return Padding(
    padding: EdgeInsets.only(left: 25.0, top: 25.0, bottom: 10.0),
    child: Container(
        height: 175.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3.0)
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 125.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0)),
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5)),
                        child: Center(
                          child: Icon(Icons.favorite, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  foodName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Breakfast',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Light food',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star_border, color: Colors.grey, size: 14.0),
                    SizedBox(width: 10.0),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              )
            ])),
  );
}

Widget getBody(TabController tabController, BuildContext context) => Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          _listItensFood(),
          _listItensFood(),
          _listItensFood(),
        ],
      ),
    );

_listItensFood() => ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 15.0, top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Recommended',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text('SEE ALL',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF469469)))
            ],
          ),
        ),
        Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getCard('assets/img/food1.jpg', 'Jaca  with Pastel'),
                getCard('assets/img/food2.jpg', 'Queijo  with leite'),
                getCard('assets/img/food3.png', 'Banana  with ovos'),
              ],
            ))
      ],
    );
