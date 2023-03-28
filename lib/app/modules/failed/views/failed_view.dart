import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/failed_controller.dart';

class FailedView extends GetView<FailedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FailedView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FailedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
