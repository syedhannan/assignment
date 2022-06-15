import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeImages extends StatefulWidget {
  final String url;
  SwipeImages({required this.url});

  @override
  State<SwipeImages> createState() => _SwipeImagesState();
}

class _SwipeImagesState extends State<SwipeImages> {
  @override
  Widget build(BuildContext context) {
    var count = 0;
    return count == 1
        ? Container()
        : Swipable(
            threshold: 0.6,
            verticalSwipe: false,
            child: Image.asset("${widget.url}"),
          );
  }
}
