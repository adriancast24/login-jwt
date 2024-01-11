import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class AuthController{
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future loginUser() async{
    const url = 'http://192.168.0.119:8090/api/auth/login';

    var response = await http.post(Uri.parse(url),
      headers: { "Content-Type": "application/json",},
      body: jsonEncode({
        "usernameOrEmail":"test4",
        "password":"test"
      }));
    if(response.statusCode==200){
      var loginarr = json.decode(response.body);
      print(response.statusCode);
      print(loginarr);
    }else {
      print(response.statusCode);
      print("xd");
    }
  }
}