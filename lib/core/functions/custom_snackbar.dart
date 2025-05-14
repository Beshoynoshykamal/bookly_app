import 'package:flutter/material.dart';

 // ignore: non_constant_identifier_names
 custom_snackbar(context, String text) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(text)));
   
}