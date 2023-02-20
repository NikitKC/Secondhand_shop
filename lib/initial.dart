
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondhandshop/ApiService/HomePageService.dart';

import 'package:secondhandshop/bottomnav.dart';



class InitialScreen extends StatelessWidget{
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
          future: Provider.of<ProductService>(context , listen:  false).getProduct(),
          builder: (context, snapshot){
      //if ( snapshot.connectionState  == ConnectionState.waiting ){
     //   return const CircularProgressIndicator();
   //   } else if(snapshot.connectionState == ConnectionState.done){
        if (snapshot.hasData) {

          return Bottomnavbar(list: snapshot.data!,);
        } else {
          print(snapshot.error);
          print("We have error");
          print(snapshot.data);
          return const Center(
            child: Text("Data lost"),
          );
        }
      }




      ),
    );
  }

}