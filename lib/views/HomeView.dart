import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/ViewModels/CRUDModel.dart';
import 'package:flutterproject/models/productModel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }
}
class HomeViewState extends State<HomeView>{

@override
  Widget build(BuildContext context) {
  final productsProvider = Provider.of<CRUDModel>(context);
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('Home Page'),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.pushNamed(context, '/addProduct');
    },
      child:Icon(Icons.add),
    ),
    body: Container(child: StreamBuilder(
      stream: productsProvider.fetchProductAsStream()
        ,builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            List<Product> products = snapshot.data.documents
                .map((doc) => Product.fromJson(doc.data, doc.documentID))
                .toList();
            return ListView.builder(
                itemCount: products.length
                , itemBuilder: (context,index){
                   return ProductCard(productDetails: products[index],);
            });
          }else{
            return Center(child: Text('Fetching'),);
          }
    }),
    ),

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
class ProductCard extends StatelessWidget{
  final Product productDetails;
  ProductCard({this.productDetails});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return GestureDetector(onTap: (){
    },child: Container(child:
      Card(child: Container(
        height:size.height*0.3,
        width: size.width*0.9,
        child: Row(children: <Widget>[
          Hero(tag: productDetails.id, child:
            Image.asset('assets ',
          height: size.height*0.4,
          width: size.width*0.4,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
            Text(productDetails.name,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
            Text('${productDetails.price}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.black ),),
          ],)
        ],),
      ),),));
  }

}