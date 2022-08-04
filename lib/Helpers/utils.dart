import 'package:flutter/material.dart';

class Utils {
  // Checks If An Email Is Valid
  static bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.’,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // Generate Dummy residence List
  static List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> countries = [
      const DropdownMenuItem(value: "Estonia", child: Text("Estonia")),
      const DropdownMenuItem(value: "Egypt", child: Text("Egypt")),
      const DropdownMenuItem(value: "England", child: Text("England")),
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Finland", child: Text("Finland")),
      const DropdownMenuItem(value: "Russia", child: Text("Russia")),
    ];
    return countries;
  }
}
