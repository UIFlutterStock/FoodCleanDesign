import 'package:flutter/material.dart';

import 'tabbarview.widget.dart';
import 'top.widget.dart';

class UserRecipes extends StatefulWidget {
  @override
  _UserRecipesState createState() => _UserRecipesState();
}

class _UserRecipesState extends State<UserRecipes>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          topwidget(),
          getTabBar(tabController),
          getBody(tabController,context)
        ],
      ),
    ));
  }
}
