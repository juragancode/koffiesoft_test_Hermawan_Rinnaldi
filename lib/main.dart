import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_01_h_r/utils/themeYouApp.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeYouApp(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
