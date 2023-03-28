import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

final RegisterController controller = Get.put(RegisterController());

class RegisterView extends StatefulWidget {
  @override
  XRegisterViewState createState() => XRegisterViewState();
}

class XRegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    controller.emailRegister.addListener(_updateButtonState);
    controller.hpRegister.addListener(_updateButtonState);
    controller.firstnameRegister.addListener(_updateButtonState);
    controller.lastnameRegister.addListener(_updateButtonState);
    controller.tglLahirRegister.addListener(_updateButtonState);
    controller.genderRegister.addListener(_updateButtonState);
    controller.passwordRegister.addListener(_updateButtonState);
    controller.passwordConfirmRegister.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      controller.checkButtonStatus();
      controller.checkKesamaanPassword();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.emailRegisterFN.unfocus();
        controller.hpRegisterFN.unfocus();
        controller.firstnameRegisterFN.unfocus();
        controller.lastnameRegisterFN.unfocus();
        controller.tglLahirRegisterFN.unfocus();
        controller.genderRegisterFN.unfocus();
        controller.passwordRegisterFN.unfocus();
        controller.passwordConfirmRegisterFN.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {
                print("Back button pressed");
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.back,
              ),
            ),
          ),
          title: Text(
            'Back',
            style: TextStyle(),
          ),
        ),
        body: Container(
          decoration: Background(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.only(left: 41),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.emailRegisterFN,
                      controller: controller.emailRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.hpRegisterFN,
                      controller: controller.hpRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'phone number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.firstnameRegisterFN,
                      controller: controller.firstnameRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'first name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.lastnameRegisterFN,
                      controller: controller.lastnameRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'last name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.tglLahirRegisterFN,
                      controller: controller.tglLahirRegister,
                      autocorrect: false,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1933),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          controller.tglLahirRegister.text =
                              DateFormat('yyyy-MM-dd').format(date);
                        }
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'date of birth',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      focusNode: controller.genderRegisterFN,
                      controller: controller.genderRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      onTap: () {
                        // Tampilkan dropdown untuk memilih jenis kelamin
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text('select gender'),
                              children: [
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      controller.selectedGender = 1;
                                      controller.genderRegister.text = 'male';
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'male',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      controller.selectedGender = 2;
                                      controller.genderRegister.text = 'female';
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'female',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'gender',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Obx(
                      () => TextFormField(
                        focusNode: controller.passwordRegisterFN,
                        controller: controller.passwordRegister,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        obscureText:
                            controller.obscureTextPasswordRegister.value,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                controller.obscureTextPasswordRegister.value =
                                    !controller
                                        .obscureTextPasswordRegister.value;
                              },
                              child: Icon(
                                  controller.obscureTextPasswordRegister.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Obx(
                      () => TextFormField(
                        focusNode: controller.passwordConfirmRegisterFN,
                        controller: controller.passwordConfirmRegister,
                        autocorrect: false,
                        obscureText:
                            controller.obscureTextPasswordConfirmRegister.value,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                controller.obscureTextPasswordConfirmRegister
                                        .value =
                                    !controller
                                        .obscureTextPasswordConfirmRegister
                                        .value;
                              },
                              child: Icon(
                                  controller.obscureTextPasswordConfirmRegister
                                          .value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          hintText: 'confirm password',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  ButtonRegister(),
                  SizedBox(height: 52),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        child: Text(
                          "Login here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.amber.shade200,
                            fontSize: 14.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
