import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_01_h_r/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  FocusNode usernameLoginFN = FocusNode();
  FocusNode passwordLoginFN = FocusNode();

  RxBool obscureTextLogin = true.obs;
  RxBool loadingLogin = false.obs;
  RxBool isButtonLogin = true.obs;

  void checkButtonStatus() {
    if (usernameLogin.text.isNotEmpty && passwordLogin.text.isNotEmpty) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }

  void loginButton() async {
    loadingLogin.value = true;
    try {
      var response = await http.post(
        Uri.parse("https://grinder.koffiesoft.com/login"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "grant_type": "",
          "username": usernameLogin.text,
          "password": passwordLogin.text,
          "scope": "",
          "client_id": "",
          "client_secret": ""
        },
      );
      loadingLogin.value = false;
      Map<String, dynamic> logdata =
          jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
      if (logdata['status']['kode'] == "success") {
        Get.offAllNamed(Routes.SUCCESS);
      } else if (logdata['status']['kode'] == "failed") {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "${logdata['status']['keterangan']}",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Login gagal",
        middleText: "Periksa koneksi internet",
      );
    }
  }
}
