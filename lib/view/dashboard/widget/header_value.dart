import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';

Expanded heading({String? name}) {
  return Expanded(
    child: Container(
      height: 50,
      color: AppColor.grey100,
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Expanded value({String? name, Color color = Colors.black}) {
  return Expanded(
    child: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(fontSize: 15, color: color),
      ),
    ),
  );
}
