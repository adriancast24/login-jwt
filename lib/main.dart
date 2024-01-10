import 'package:autentificacion_jwt/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show ascii, base64, json, jsonDecode, jsonEncode;

const SERVER_IP = 'http://192.168.5.101:8080/api/security/';
final storage = FlutterSecureStorage();

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHome(),
    );
  }
}



class MyHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController() ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign In", style: TextStyle(fontSize: 25),),
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

          ElevatedButton(onPressed: () async {
            var jwt = await authController.loginUser();

            var res = get();
            if(jwt != null){

              Map<String, dynamic> tooken = jsonDecode(jwt);
              //print(tok);

              tooken.forEach((key, value){
                final tok = value;
                return tok;
              });
              
              }

              print(ValueKey("mira $jwt"));




          }, child: Text('iniciar sesion')  )
        ],
      )

    );
  }
}
