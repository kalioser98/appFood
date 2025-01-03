import "package:flutter/material.dart";
import "package:foodloop/Views/widgets/fl_app_bar.dart";
import "package:foodloop/Views/widgets/fl_sidemenu.dart";

class TestView extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: FlSideMenu().getDrawer(Navigator.of(context)),
      appBar: FlAppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {_scaffoldKey.currentState?.openDrawer();},
        )
      ).appBar(),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Center(child: Text("These are the products you have added to your cart")),
              Text("AAA")
            ],
          ),
        ),
      ),
    );
  }
}