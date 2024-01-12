import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';




class AuthController{
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future loginUser() async{
    const url = 'http://192.168.0.119:8090/api/auth';

    var response = await http.post(Uri.parse("$url/login"),
        headers: { "Content-Type": "application/json",},
        body: jsonEncode({
          "usernameOrEmail": username_controller.text,
          "password": password_controller.text
        }));
    if(response.statusCode==200){
      var loginarr = json.decode(response.body);
      print(loginarr);
      print(response.statusCode);

      return (response.body);

    }else {
      print(response.statusCode);

    }
  }
}

Future get( String token) async {
  final res = await http
      .get(Uri.parse('http://192.168.0.119:8090/api/users/me'),
      headers: {"Authorization" : "Bearer $token"}

  );
  if(res.statusCode==200){
    var loginarr = json.decode(res.body);
    print(res.statusCode);
    print(loginarr);
    print('solicitud exitosa');

    return (res.body);

  }else {
    print(res.statusCode);
  }



}