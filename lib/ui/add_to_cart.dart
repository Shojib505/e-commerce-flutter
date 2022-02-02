import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late double displayHeight = MediaQuery.of(context).size.height;
  late double displayWidth = MediaQuery.of(context).size.width;
  int itemQuantity = 0;
  int pro = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: (){Navigator.pop(context,true);},
        // ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/img.jpeg"),
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage("images/shoes.jpg"),
                    height: 200,
                    width: 150,
                  ),
                  Column(
                    children: [
                      Text("Product Name"),
                      Text("Price : 555"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: _itemQuantityIncrement,
                          icon: Icon(Icons.add_circle_outline_outlined)),
                      Text('$itemQuantity'),
                      IconButton(
                          onPressed: _itemQuantityDecrement,
                          icon: Icon(Icons.remove_circle_outline)),
                    ],
                  ),
                ],
              ),
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemCount: pro,
              //   itemBuilder: (context, index) {
              //     return
              //   },
              // ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Buy"),
            ),
          ],
        ),
      ),
    );
  }

  void _itemQuantityIncrement() {
    setState(() {
      itemQuantity++;
    });
  }

  void _itemQuantityDecrement() {
    setState(() {
      itemQuantity--;
      if (itemQuantity < 1) {
        itemQuantity = 1;
      }
    });
  }
}
