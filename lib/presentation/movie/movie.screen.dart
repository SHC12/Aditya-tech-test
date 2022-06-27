import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/movie.controller.dart';

class MovieScreen extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MovieScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
