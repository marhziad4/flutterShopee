import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterproject/componets/horizontal_listView.dart';

class HomePage extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}
class MyHomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images:[
        AssetImage('images/c1.jpg'),
        AssetImage('images/n1.jpeg'),
        AssetImage('images/w3.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/c1.jpg'),
        AssetImage('images/n2.jpg'),
      ],
        autoplay: false,
        //animationCurve: Curves.fastOutSlowIn,
       // animationDuration: Duration(milliseconds:1000 ),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text('ShopApp'),
        actions: <Widget>[
        new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
        new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){}),
      ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
            accountName: Text('Marh'),
            accountEmail: Text('marh@gmail'),

              currentAccountPicture: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,color: Colors.white,),
            ),
    ),
              decoration: new BoxDecoration(
                color: Colors.red
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Home page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('My Order'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Categoris'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),
          ],
        ),
      ),

    );


  }
}