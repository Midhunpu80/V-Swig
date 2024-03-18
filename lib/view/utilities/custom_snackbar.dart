import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customsnackbar(
    {
    required var titile,
    required var messege,
    required Color col}) async {
  final snack = Get.rawSnackbar(
    ///duration: const Duration(seconds: 5),
    backgroundColor: col,
    title: titile,
    message: messege,
  );
  return snack;
}
