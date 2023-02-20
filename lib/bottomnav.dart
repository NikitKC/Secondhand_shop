
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:secondhandshop/categories/categories.dart';
import 'package:secondhandshop/homePage/homescreen.dart';
import 'package:secondhandshop/homePage/searchscreen.dart';

import 'package:secondhandshop/sizeanddecoration/constraints.dart';






class Bottomnavbar extends StatefulWidget {
  final int? index ;
  final  list;
  Bottomnavbar({Key? key,  this.index, required this.list,}) : super(key: key);
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {

  int _currentIndex = 0;
  PageController _pageController  = PageController(initialPage: 0, keepPage: false);
  @override
  void initState() {
    print("form bottom nav ${widget.list}");
    if(widget.index== 3){
      _currentIndex = 3;
      _pageController = PageController(initialPage: 3, keepPage: false);
    }
    if(widget.index== 4){
      _currentIndex = 4;
      _pageController = PageController(initialPage: 4, keepPage: false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(list: widget.list,),
            Search(list: widget.list,),
            Categories(list: widget.list)

          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            activeColor: primaryColor,
            inactiveColor: darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search_sharp),
            title: Text("Search"),
            activeColor: primaryColor,
            inactiveColor: darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.list_alt),
            title: Text("Categories"),
            activeColor: primaryColor,
            inactiveColor:darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_box_rounded),
            title: Text("Add your Product"),
            activeColor: primaryColor,
            inactiveColor: darkgrey,
          ),

          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("My Account"),
            activeColor: primaryColor,
            inactiveColor:darkgrey,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
