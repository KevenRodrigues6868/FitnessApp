import 'package:flutter/material.dart';
import 'Scenes/Home/home.dart';
import 'Common/utils.dart';

void main() {
  runApp(MaterialApp(
      title: 'Fitness App',
      theme: getTheme(),
      home: HomeScene()));
}