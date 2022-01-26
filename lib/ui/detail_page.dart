import 'package:e_commerce_flutter/assistant/screen_config.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenSize.safeAreaHorizontal * 0.50,
            decoration: BoxDecoration(color: Colors.amberAccent),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .30,
            decoration: BoxDecoration(color: Colors.redAccent),
          )
        ],
      ),
    );
  }
}
