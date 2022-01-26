import 'package:flutter/material.dart';

class TestHomeScreen extends StatefulWidget {
  const TestHomeScreen({Key? key}) : super(key: key);

  @override
  _TestHomeScreenState createState() => _TestHomeScreenState();
}

class _TestHomeScreenState extends State<TestHomeScreen> {
  ////////////////HERE IS THE PopularItemsData LIST MODA////////////////////////////////////////////
  var PopularItemsData = [
    {
      "name": "Broun Sofa",
      "brand": "RFL",
      "price": 200,
      "image": "facebook_icon.png"
    },

    {"name": "Broun Sofa", "brand": "RFL", "price": 200, "image": "img.jpeg"},

    {"name": "Broun Sofa", "brand": "RFL", "price": 200, "image": "images.png"},

    // {
    //   "name":"Broun Sofa",
    //   "brand":"RFL",
    //   "price":200,
    //   "image":"images.png"
    // },
  ];

  final CategoriesListScroller categoriesListScroller =
      CategoriesListScroller();
////////////////DYNAMIC ITEMS LIST EMPTY DECLARE////////////////////////////////////////////
  List<Widget> mainItemsData = [];

////////////////DYNAMIC ITEMS WIDGET LIST BUILDER////////////////////////////////////////////
  void getPopularPostData() {
    ////////////////CREATED A PopularItemsData LIST MODAL ASSIGN IT TO responseListData DYNAMIC LIST ////////////////////////////////////////////
    List<dynamic> responseListData = PopularItemsData;

    ////////////////ADDING ALL DYNAMIC DATA TO ANOTHER listItems LIST////////////////////////////////////////////
    List<Widget> listItems = [];
    responseListData.forEach((popularPost) {
      listItems.add(Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(popularPost["name"],
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                  Text(popularPost["brand"],
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("\$ ${popularPost["price"]}",
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                ],
              ),
              Image.asset(
                "image/${popularPost["image"]}",
                height: double.infinity,
              )
            ],
          ),
        ),
      ));
    });
    setState(() {
      ////////////////NOW SETTING THE ALL DYNAMIC DATA FROM listItems LIST TO mainItemsData LIST////////////////////////////////////////////
      mainItemsData = listItems;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPopularPostData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
          actions: <Widget>[
            IconButton(
                onPressed: () {}, icon: Icon(Icons.person, color: Colors.black))
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("SEAECH BAR"),
                  // TextField(
                  //     decoration: InputDecoration(
                  //         hintText: "Search",
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20.0)),
                  //         suffixIcon: IconButton(
                  //             onPressed: () {},
                  //             icon: Icon(Icons.search, color: Colors.black)
                  //           )
                  //     )
                  // ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.sort, color: Colors.black)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Catefories",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_right, color: Colors.black)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
////////////////FIXED CATEGORY LIST SCROLL ADDING IN FIRST ROW////////////////////////////////////////////
              categoriesListScroller,
              Expanded(
                  child: ListView.builder(
////////////////DYNAMIC ITEMS LIST ADDING BY CALLING mainItemsData<Widget> LIST FROM TOP////////////////////////////////////////////
                      itemCount: mainItemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return mainItemsData[index];
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesListScroller extends StatefulWidget {
  const CategoriesListScroller({Key? key}) : super(key: key);

  @override
  _CategoriesListScrollerState createState() => _CategoriesListScrollerState();
}

/////////////////FIXED CATEGORY LIST SCROLL HORIZONTAL////////////////////////////////////////////
class _CategoriesListScrollerState extends State<CategoriesListScroller> {
  @override
  Widget build(BuildContext context) {
    final double categorisHeight = MediaQuery.of(context).size.height * 0.30;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          ////////////////CATEGORY LIST////////////////////////////////////////////
          children: <Widget>[
            ////////////////CATEGORY ITEM////////////////////////////////////////////
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: categorisHeight,
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      "Best Budget\nSofa",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Tap Here",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            ////////////////CATEGORY ITEM////////////////////////////////////////////
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: categorisHeight,
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      "Best Budget\nSofa",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Tap Here",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            ////////////////CATEGORY ITEM////////////////////////////////////////////
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: categorisHeight,
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      "Best Budget\nSofa",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Tap Here",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            ////////////////CATEGORY ITEM////////////////////////////////////////////
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: categorisHeight,
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      "Best Budget\nSofa",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Tap Here",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
