
import 'package:flutter/material.dart';
import 'package:secondhandshop/arguments.dart';
import 'package:secondhandshop/bottomnav.dart';
import 'package:secondhandshop/categories/categorydata.dart';
import 'package:secondhandshop/homePage/homescreen.dart';
import 'package:secondhandshop/initial.dart';


const String initial = "/";
const String home = '/home';
const String addshop = '/addshop';
const String login = '/login';
const String register = '/register';
const String myAccount = '/account';
const String accInfo = '/accinfo';
const String bottomnav = "/nav";
const String categorydata = "/category";

class Routing {
  static Route<dynamic> generateRoute(RouteSettings screen) {

    switch (screen.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => InitialScreen());
      case home:
        ScreenArguments args = screen.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (_) => HomeScreen(list: args.list!,));

      case bottomnav:
        ScreenArguments args = screen.arguments as ScreenArguments;
        return MaterialPageRoute(

          builder: (_) =>
              Bottomnavbar(
                index: args.index,
                list: args.list!,
              ),
        );
      case categorydata:
        ScreenArguments args = screen.arguments as ScreenArguments;
        return MaterialPageRoute(

          builder: (_) =>
              CategoryData(
                cattype: args.ccat!,
                list: args.list!,
              ),
        );

      default:
        ScreenArguments args = screen.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (_) => Bottomnavbar(list:args.list!,));
    }
  }
}
