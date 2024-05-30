import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget jobType(SvgPicture svgicon, Color? bubblecolor, String bubbletext) =>
    Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        width: 55,
        height: 55,
        decoration: BoxDecoration(shape: BoxShape.circle, color: bubblecolor),
        child: IconButton(
          icon: svgicon,
          onPressed: () {},
        ),
      ),
      Container(
          width: 75,
          alignment: Alignment.center,
          child: Text(
            bubbletext,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                overflow: TextOverflow.ellipsis),
          )),
    ]);
