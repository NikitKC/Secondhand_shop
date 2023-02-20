import 'package:flutter/material.dart';
import 'package:secondhandshop/arguments.dart';
import 'package:secondhandshop/route.dart';





class Categories extends StatefulWidget {
  final list;
  const Categories({Key? key, required this.list}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Widget _buildInfo(BuildContext context) {
    return Positioned(
      //top: 230,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.lightBlue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('AutoMobiles'),
                leading: Icon(Icons.motorcycle_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );

                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Books & Learning'),
                leading: Icon(Icons.book_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Computer & Peripherals'),
                leading: Icon(Icons.computer_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Electronics'),
                leading: Icon(Icons.electrical_services_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Home, Furnishing & Appliances'),
                leading: Icon(Icons.home_max_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Mobile & Accessories'),
                leading: Icon(Icons.mobile_screen_share_rounded),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Musical Instrument'),
                leading: Icon(Icons.music_note_outlined),
                onTap: () {
                  Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                      ccat: 'AutoMobiles',
                      list: widget.list
                  )
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.transparent,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Categories'),
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _buildInfo(context),
          ],
        ),
      ),
    );
  }
}
