import 'package:flutter/material.dart';

import 'package:secondhandshop/sizeanddecoration/constants.dart';


class CategoryData extends StatefulWidget{
  final list;
  final String cattype;
  const CategoryData({Key? key, required this.list, required this.cattype}) : super(key: key);

  @override
  _CategoryDataState createState() => _CategoryDataState();
}

class _CategoryDataState extends State<CategoryData> {
  List? list;

  @override
  void initState() {

    list = widget.list.where((element) => element["category_details"]["slug"]!.toString() == widget.cattype)
        .toList();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return (_loading == true)?CircularProgressIndicator():Center (child:Text("${list!.length}"));
    return Scaffold(
      appBar: AppBar(),
      body:(list!.isEmpty)? const Center(child: Text("No Products")): GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount:list!.length,
          itemBuilder: (context ,i){
            var prd = list![i];
            return GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: AppTheme.fullWidth(context) * 0.4,
                        width: AppTheme.fullWidth(context) * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          prd.imageUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: AppTheme.fullHeight(context) * 0.06,
                      width: AppTheme.fullWidth(context) * 0.45,
                      decoration: BoxDecoration(
                          color: LightColor.background,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 50,
                              color:
                              LightColor.primaryColor.withOpacity(0.23),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 4,
                                horizontal: defaultPadding / 4),
                            child: Text(
                              prd.productName!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "\Rs${prd.price}",
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
          }),
    );
  }
}