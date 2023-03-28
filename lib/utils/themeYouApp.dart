import 'package:flutter/material.dart';

ThemeData ThemeYouApp() {
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 37, 141, 130), // Mengubah warna primary
      onPrimary: Colors.white, // Mengubah warna teks pada tombol primary
      surface: Colors.teal, // Mengubah warna background
      onSurface: Colors.white, // Mengubah warna teks pada background
    ),
    dialogBackgroundColor: Colors.grey[800], // Mengubah warna background dialog
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
