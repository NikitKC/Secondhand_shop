import 'package:flutter/material.dart';
import 'package:secondhandshop/sizeanddecoration/constants.dart';




class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
   required this.list,


  }) : super(key: key);

 final  list ;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 3, 8, 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 120,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  list["image_url"].toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 60,
              width: 145,
              decoration: BoxDecoration(
                  color: LightColor.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color:
                      LightColor.primaryColor.withOpacity(0.23),
                    ),
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding:  const EdgeInsets.symmetric(
                        vertical: defaultPadding / 4,
                        horizontal: defaultPadding / 4),
                    child: Text(
                  list['product_name'],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "\Rs ${list["price"].toString()}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: LightColor.textLightColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}