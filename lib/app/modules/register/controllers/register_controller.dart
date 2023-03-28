import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_01_h_r/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  FocusNode emailRegisterFN = FocusNode();
  FocusNode hpRegisterFN = FocusNode();
  FocusNode firstnameRegisterFN = FocusNode();
  FocusNode lastnameRegisterFN = FocusNode();
  FocusNode tglLahirRegisterFN = FocusNode();
  FocusNode genderRegisterFN = FocusNode();
  FocusNode passwordRegisterFN = FocusNode();
  FocusNode passwordConfirmRegisterFN = FocusNode();

  TextEditingController emailRegister = TextEditingController();
  TextEditingController hpRegister = TextEditingController();
  TextEditingController firstnameRegister = TextEditingController();
  TextEditingController lastnameRegister = TextEditingController();
  TextEditingController tglLahirRegister = TextEditingController();
  TextEditingController grupRegister = TextEditingController();
  TextEditingController genderRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController passwordConfirmRegister = TextEditingController();

  RxBool obscureTextPasswordRegister = true.obs;
  RxBool obscureTextPasswordConfirmRegister = true.obs;

  RxBool isButtonRegister = true.obs;
  RxBool passwordSama = false.obs;
  RxBool loadingRegister = false.obs;

  int selectedGender = 1;

  void checkButtonStatus() {
    if (

        ///
        emailRegister.text.isNotEmpty &&
            hpRegister.text.isNotEmpty &&
            firstnameRegister.text.isNotEmpty &&
            lastnameRegister.text.isNotEmpty &&
            tglLahirRegister.text.isNotEmpty &&
            genderRegister.text.isNotEmpty &&
            passwordRegister.text.isNotEmpty &&
            passwordConfirmRegister.text.isNotEmpty

        ///
        ) {
      isButtonRegister.value = false;
    } else {
      isButtonRegister.value = true;
    }
  }

  void checkKesamaanPassword() {
    if (passwordRegister.text == passwordConfirmRegister.text) {
      passwordSama.value = true;
    } else {
      passwordSama.value = false;
    }
  }

  void registerButton() async {
    if (passwordRegister.text == passwordConfirmRegister.text) {
      try {
        loadingRegister.value = true;
        grupRegister.text = "member";

        var response = await http.post(
          Uri.parse("https://grinder.koffiesoft.com/users"),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "email": emailRegister.text,
            "hp": hpRegister.text,
            "firstname": firstnameRegister.text,
            "lastname": lastnameRegister.text,
            "grup": grupRegister.text,
            "role": "",
            "tgl_lahir": tglLahirRegister.text,
            "jenis_kelamin": selectedGender,
            "password": passwordConfirmRegister.text,
            "strict_password": false,
            "referral_code": ""
          }),
        );
        loadingRegister.value = false;
        Map<String, dynamic> logdata =
            jsonDecode(response.body) as Map<String, dynamic>;
        print(response.body);
        print(tglLahirRegister.text);
        if (logdata['status']['kode'] == "success") {
          Get.offAllNamed(Routes.SUCCESS);
        } else if (logdata['status']['kode'] == "failed") {
          Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "${logdata['status']['keterangan']}",
          );
        } else if (logdata['detail']['loc'] == ["body", 204]) {
          Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText:
                "${logdata['detail']['msg']} \n ${logdata['detail']['type']} ",
          );
        }
      } catch (e) {
        Get.defaultDialog(
          title: "error",
          middleText: "$e",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Password tidak sama",
        middleText: "Password harus sama",
      );
    }
  }
}
