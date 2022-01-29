import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late double displayHeight = MediaQuery.of(context).size.height;
  late double displayWidth = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: displayHeight * 07,
          child: Container(
            child: Text("data"),
            // child: ListView.builder(itemBuilder: itemBuilder),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Buy"))
      ],
    ));
  }
}
