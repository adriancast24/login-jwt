import 'dart:async';
import 'dart:io';

import 'package:autentificacion_jwt/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class AuthController{
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future loginUser() async{
    const url = 'http://adempiere.erpcya.com:1174/api/security';

    var response = await http.post(Uri.parse("$url/login"),
      headers: { "Content-Type": "application/json",},
      body: jsonEncode({
        "user_name":"jAlbujas",
        "user_pass":"jAlbujas"
      }));
    if(response.statusCode==200){
      var loginarr = json.decode(response.body);
      print(loginarr);
      return (response.body);

    }else {
      print(response.statusCode);
      print("xd");
    }
  }
}

Future get() async {
  String? token = await storage.read(key: "jwt");
  print("prueba $token");
  //print(Value);
  final res = await http
      .get(Uri.parse('http://adempiere.erpcya.com:1174/api/security/menu'),
      headers: {"Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMjIxMzY2IiwiQURfQ2xpZW50X0lEIjoxMDAwMDAwLCJBRF9PcmdfSUQiOjEwMDAwNTEsIkFEX1JvbGVfSUQiOjEwMDAwMDAsIkFEX1VzZXJfSUQiOjEwMDAwMTcsIk1fV2FyZWhvdXNlX0lEIjoxMDAwNDM2LCJBRF9MYW5ndWFnZSI6ImVuX1VTIiwiaWF0IjoxNzA0ODk2ODk3LCJleHAiOjE3MDQ5ODMyOTd9.EGXg6uSSOfJntIEWoUnAzHaYVJI1UAV09PWgGidu_DI"}

  );
  if(res.statusCode==200){
    var loginarr = json.decode(res.body);
    print(res.statusCode);
    print(loginarr);
    return (res.body);

  }else {
    print(res.statusCode);
    print("xd");
  }



}