import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_flutter/assistant/controller.dart';
import 'package:e_commerce_flutter/assistant/helper.dart';
import 'package:e_commerce_flutter/ui/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  // const HomePage({Key? key, required this.items}) : super(key: key);
  //final List<String> items;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double displayHeight = MediaQuery.of(context).size.height;
  late double displayWidth = MediaQuery.of(context).size.width;
  String userName = "";
  final _controller = Get.put(Controller());
  int item = 5;

//   var PopularItemsData = [
//     {
//       "name": "Broun Sofa",
//       "brand": "RFL",
//       "price": 200,
//       "image": "facebook_icon.png"
//     },
//     {"name": "Broun Sofa", "brand": "RFL", "price": 200, "image": "img.jpeg"},
//     {"name": "Broun Sofa", "brand": "RFL", "price": 200, "image": "images.png"},
//   ];
//   List<Widget> mainItemsData = [];
// ////////////////DYNAMIC ITEMS WIDGET LIST BUILDER////////////////////////////////////////////
//   void getPopularPostData() {
//     ////////////////CREATED A PopularItemsData LIST MODAL ASSIGN IT TO responseListData DYNAMIC LIST ////////////////////////////////////////////
//     List<dynamic> responseListData = PopularItemsData;

//     ////////////////ADDING ALL DYNAMIC DATA TO ANOTHER listItems LIST////////////////////////////////////////////
//     List<Widget> listItems = [];
//     responseListData.forEach((popularPost) {
//       listItems.add(Container(
//         height: 150,
//         margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
//             ]),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               // Column(
//               //   children: [
//               //     Container(
//               //       height: displayHeight * 0.10,
//               //       width: displayHeight * 0.20,
//               //       child: Center(
//               //         child: Image.asset("image/${popularPost["image"]}"),
//               //       ),
//               //     ),
//               //     Container(
//               //       height: displayHeight * 0.06,
//               //       width: displayWidth * 0.20,
//               //       child: Center(
//               //         child: Text(
//               //           popularPost["name"],
//               //           // "Category title",
//               //           style: TextStyle(
//               //             fontSize: 15,
//               //             fontWeight: FontWeight.bold,
//               //           ),
//               //           textAlign: TextAlign.center,
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // )
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(popularPost["name"],
//                       style: TextStyle(fontSize: 17, color: Colors.grey)),
//                   Text(popularPost["brand"],
//                       style: TextStyle(fontSize: 17, color: Colors.grey)),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text("\$ ${popularPost["price"]}",
//                       style: TextStyle(fontSize: 17, color: Colors.grey)),
//                 ],
//               ),
//               Image.asset(
//                 "image/${popularPost["image"]}",
//                 height: double.infinity,
//               )
//             ],
//           ),
//         ),
//       ));
//     });
//     setState(() {
//       ////////////////NOW SETTING THE ALL DYNAMIC DATA FROM listItems LIST TO mainItemsData LIST////////////////////////////////////////////
//       mainItemsData = listItems;
//     });
//   }

  @override
  void initState() {
    //getSharedPreferences();
    super.initState();
    _controller.getAllCategoryList();
    _controller.getAllProductList();
    _controller.getAllSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Text(userName),
      // ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("E-Cmmerce APP",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      // );
                    },
                    child: CircleAvatar(
                      //child: Image(image: AssetImage("images/img.jpeg")),
                      child: Image.network(
                          'https://www.freeiconspng.com/uploads/clipart--person-icon--cliparts-15.png'),
                      radius: 25, foregroundColor: Colors.blueGrey,
                    ),
                  )
                ],
              )),

////////////////////////////////////Carosual // //////////////////////////

          Container(
            height: 300,
            child: Obx(() {
              if (_controller.loadingSliderList.value) {
                return CircularProgressIndicator();
              } else {
                return CarouselSlider.builder(
                    itemCount: _controller.dataSliderList.length,
                    itemBuilder: (context, index, spIndex) {
                      return ClipRRect(
                        child: CachedNetworkImage(
                            imageUrl: Helper.baseUrl +
                                _controller.dataSliderList[index].sliderImage
                                    .toString(),
                            height: 300,
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 290,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: Duration(seconds: 2)));
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      // 'Categories' title row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_right_alt, size: 30),
                          )
                        ],
                      ),
                      // 'Categories' dynamic item's
                      Obx(() {
                        if (_controller.loadingCategoryList.value) {
                          return CircularProgressIndicator();
                        } else {
                          return Container(
                            height: displayHeight * 0.20,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.orange[400],
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 10.0)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _controller.dataCategoryList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: displayHeight * 0.10,
                                          width: displayHeight * 0.20,
                                          child: Center(
                                            child: Image.network(
                                                Helper.baseUrl +
                                                    _controller
                                                        .dataCategoryList[index]
                                                        .categoryImage
                                                        .toString()),
                                          ),
                                        ),
                                        Container(
                                          height: displayHeight * 0.06,
                                          width: displayWidth * 0.20,
                                          // ignore: prefer_const_constructors
                                          child: Center(
                                            child: Text(
                                              _controller
                                                  .dataCategoryList[index].name
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.02,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF2F5F5),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                const Divider(indent: 200, endIndent: 200, thickness: 5),
                SizedBox(height: displayHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right_alt, size: 30),
                    )
                  ],
                ),
                SizedBox(height: displayHeight * 0.01),
                Obx(() {
                  if (_controller.loadingProductList.value) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                        height: displayHeight * 0.8,
                        width: displayWidth,
                        //mainAxisSpacing:5,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: _controller.dataProductList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(index.toString() + "INSIDE HOME");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              itemIndex: index,
                                            )));
                              },
                              child: Container(
                                height: displayHeight * 0.15,
                                width: displayWidth * 0.25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Image(image: AssetImage("images/icon.png")),
                                    ClipRRect(
                                      child: Image.network(
                                          Helper.baseUrl +
                                              _controller
                                                  .dataProductList[index].img1
                                                  .toString(),
////////////////////////////////////CHANGE DYNAMIC DIVISE SIZE // //////////////////////////
                                          height: 120,
                                          width: 150,
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      // "test name",
                                      _controller.dataProductList[index].name
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Offer price: " +
                                              _controller
                                                  .dataProductList[index].price
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.red[400],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Price :" +
                                              _controller.dataProductList[index]
                                                  .sellingPrice
                                                  .toString(),
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ));
                  }
                })
              ],
            ),
          )
        ]),
      ),
    );
  }

  // void getSharedPreferences() async {
  //   UserInfo userInfo = UserInfo();
  //   await userInfo.getName().then((vValue) {
  //     setState(() {
  //       userName = vValue;
  //     });
  //   });
  // }
}
