import 'package:flutter/material.dart';

class topwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(height: height * 0.40),
        Container(
          height: height * 0.30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/background.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 130.0,
          left: 25.0,
          child: Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(70.0),
                image: DecorationImage(
                    image: AssetImage('assets/img/woman.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 210.0,
          left: 175.0,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sofia Andrade',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4,974 Followers',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              Container(
                height: 30.0,
                width: 75.0,
                decoration: BoxDecoration(
                    color: Color(0xFFEAF4EF),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: Text('Follow',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5A9785))),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
