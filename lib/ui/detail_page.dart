import 'package:e_commerce_flutter/assistant/controller.dart';
import 'package:e_commerce_flutter/assistant/helper.dart';
import 'package:e_commerce_flutter/assistant/screen_config.dart';
import 'package:e_commerce_flutter/ui/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.itemIndex});

  int itemIndex;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _controller = Get.put(Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getAllProductList();
  }

  @override
  Widget build(BuildContext context) {
    var itemIndexL = widget.itemIndex;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.network(
                Helper.baseUrl +
                    _controller.dataProductList[itemIndexL].img1.toString(),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * .4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .55,
              decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _controller.dataProductList[itemIndexL].name
                              .toString(),
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan),
                          overflow: TextOverflow.fade,
                          // maxLines: 1,
                          softWrap: false,
                        )
                      ]),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Regular Price: " +
                          _controller.dataProductList[itemIndexL].price
                              .toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal[600],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Offer Price: " +
                          _controller.dataProductList[itemIndexL].sellingPrice
                              .toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[600],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 25),
                  child: Container(
                    child: Text(
                      _controller.dataProductList[itemIndexL].description
                          .toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        // color: Colors.redAccent[600],
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddToCart()));
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                          child: Text(
                        'ADD TO CART',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
