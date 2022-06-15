import 'package:assignment/swipe_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardsDismiss extends StatefulWidget {
  const CardsDismiss({Key? key}) : super(key: key);

  @override
  State<CardsDismiss> createState() => _CardsDismissState();
}

class _CardsDismissState extends State<CardsDismiss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          Container(
              height: 145,
              width: 400,
              child: SwipeImages(url: "assets/img3.png")),
          Container(
              height: 130,
              width: 365,
              child: SwipeImages(url: "assets/img2.png")),
          Container(
              height: 100,
              width: 360,
              child: SwipeImages(
                url: "assets/img1.png",
              )),
        ],
      ),
    );
  }
}
