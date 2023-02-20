import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:secondhandshop/homePage/titlewithmore.dart';
import 'package:secondhandshop/sizeanddecoration/constraints.dart';

import 'itemcard.dart';

class HomeScreen extends StatelessWidget {
  final List list ;
   const HomeScreen({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
              Text("Explore",style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),),
            const Text(
              "Best SecondHand Products  for you",
              style: TextStyle(fontSize: 18),
            ),
                SizedBox(
                  height: 20,
                ),

                SectionTitle(title: "Second Hand Products", pressSeeAll: (){}),
                Container(
                  height: 500,
                   width: 500,
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                      itemCount: list.length,
                      itemBuilder: (context , i ){

                          return GestureDetector(
                            onTap: ()=>{},
                            child: ProductCard(list: list[i],),
                          );

                        }),
                )




              ],
            ),
          ),
        ),
      ),
    );
  }
}
