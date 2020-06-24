import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/views/AddDetails.dart';
import 'package:flutterproject/views/AddProduct.dart';
import 'package:flutterproject/views/HomeView.dart';


class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
          case '/':
          return MaterialPageRoute(builder: (context)=>HomeView());

          case '/addProduct':
          return MaterialPageRoute(builder: (context)=>AddProduct());

          case '/addDetails':
          return MaterialPageRoute(builder: (context)=>AddDetails());

      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(body: Center(child: Text('not sefind route'),),);
        });
    }

  }
}