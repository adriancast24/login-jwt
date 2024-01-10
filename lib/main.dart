
import 'package:autentificacion_jwt/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

const SERVER_IP = 'http://192.168.5.101:8080/api/security/';
final storage = FlutterSecureStorage();

void main() {
  runApp(
    MaterialApp(home: MyHome()),
  );
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController() ;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Log In", style: TextStyle(fontSize: 25),),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,),
            child: TextFormField(
              controller: authController.username_controller,
              decoration: InputDecoration(hintText: "Username",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,),
            child: TextFormField(
              controller: authController.password_controller,
              decoration: InputDecoration(hintText: "password",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 25,),

          ElevatedButton(onPressed: (){
            authController.loginUser();
          }, child: Text('iniciar sesion'))
        ],
      )

    );
  }
}