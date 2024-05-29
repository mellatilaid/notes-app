import 'package:flutter/material.dart';

//set border color based on model color
//if it is transpersnt set border otherways not
Border? setBorder({required int color}) {
  if (Color(color) == Colors.transparent) {
    return Border.all(
      color: Colors.grey,
      width: 2,
    );
  } else {
    return null;
  }
}
