
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

appBar(String title, String rightTitle, VoidCallback rightButtonClick) {
  return AppBar(
    centerTitle: false,
    titleSpacing: 0,
    title: Container(
      // padding: EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    ),
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
