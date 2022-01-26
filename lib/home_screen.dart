import 'package:flutter/material.dart';

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
    //getPopularPostData();
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
                    child: const CircleAvatar(
                      child: Image(image: AssetImage("images/img.jpeg")),
                      //child: Image.network('https://www.freeiconspng.com/uploads/clipart--person-icon--cliparts-15.png'),
                      radius: 25, foregroundColor: Colors.blueGrey,
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
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
                      //Container(
                      SizedBox(
                        height: displayHeight * 0.20,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //   color: Colors.orange[400],
                        //   boxShadow: [
                        //    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
                        // ),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: item,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: displayHeight * 0.10,
                                    width: displayHeight * 0.20,
                                    child: Center(
                                      child: Image.asset("images/icon.png"),
                                    ),
                                  ),
                                  Container(
                                    height: displayHeight * 0.06,
                                    width: displayWidth * 0.20,
                                    // ignore: prefer_const_constructors
                                    child: Center(
                                      child: const Text(
                                        "Category title",
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

                // build() the grid builder after the class

                // Container(
                //   height: displayHeight*0.8,
                //   width: displayWidth,
                //   mainAxisSpacing:5,

                // )
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
