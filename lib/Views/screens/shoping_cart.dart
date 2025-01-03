import "package:flutter/material.dart";
import "package:foodloop/Views/widgets/fl_app_bar.dart";

class ShopingCart extends StatelessWidget {
  
  const ShopingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlAppBar().appBar(),
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