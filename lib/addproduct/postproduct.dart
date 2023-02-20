
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondhandshop/ApiService/HomePageService.dart';
import 'package:secondhandshop/route.dart';
import 'package:secondhandshop/sizeanddecoration/constants.dart';


class PostShop extends StatefulWidget{
  final  list;

  PostShop({Key? key, this.list}) : super(key: key);

  @override
  _PostShopState createState() => _PostShopState();
}

class _PostShopState extends State<PostShop> {

  var _image;
  var imgfile;
  String? _choosedString;

  String? _imgpath;
  String? _name;
  String? _phonenumber;
  String? _price;
  String? _address;
  String? _multiline;
  String? _usereId;
  bool? _loggedin;
  List category = ["AutoMobiles","Books and Learning","Computer and Pheripherals",
    "Electronics","Mobile and Accessories","Musical Instrument","Home, Furnishing & Appliances"];
  final TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState>_formkey1 = GlobalKey<FormState>();

  getImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imgpath = image!.path.toString();
      imgfile = File(_imgpath.toString());
    });
  }


  Widget _dropdownCategory(){
    return  DropdownButton(
      hint: Text("Select Category"),
      value: _choosedString,
      onChanged: (value){
        setState(() {
          _choosedString = value as String?;
        });
      },
      items: category.map((val) {
        return DropdownMenuItem(
          value: val,
          child: Text(val),
        );
      }).toList(),

    );
  }
  Widget _buildWorkshopNameTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Your Product Name',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.text,
            validator: (value){
              if(value!.isEmpty){
                String a = 'Product Name is required';
                return a ;
              }
              return null;
            },
            onSaved: (input)=> _name = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.input,
                color: Colors.white,
              ),
              hintText: 'Enter Product Name',
              hintStyle: hintTextStyle,
            ),

          ),
        ),
      ],
    );
  }
  Widget _buildWorkshopPhoneNoTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Seller Phone Number',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value){
              if(value!.isEmpty){
                String a = 'Seller Phone Number is required';
                return a ;
              }if(value.trim().length < 10){
                return 'Phone Number  Length less than 10';
              }
              if(value.trim().length > 10){
                return 'Phone Number  Length less than 10';
              }
              return null;
            },
            onSaved: (input)=> _phonenumber = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Enter Phone Number',
              hintStyle: hintTextStyle,
            ),

          ),
        ),
      ],
    );
  }
  Widget _buildWorkshopAddressTF(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Workshop Address',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            validator: (value){
              if(value!.isEmpty ){
                String a = 'Workshop Address is required';
                return a ;
              }
              return null;
            },
            onSaved: (input)=> this._address = _controller.text ,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              hintText: 'Enter Workshop Address',
              hintStyle: hintTextStyle,
            ),

          ),
        ),

      ],
    );
  }

  Widget _buildWorkshopDescriptionTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description of your Product',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(

          ),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLength: 200,
            validator: (value){
              if(value!.isEmpty){
                String a = 'Description Required';
                return a ;
              }
              return null;
            },
            onSaved: (input)=> _multiline = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )),
              labelText: "Description" ,
              labelStyle: labelStyle,
              helperText: "Write About the product you want to sell",
              helperStyle: labelStyle,

            ),
            maxLines: 5,

          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn(BuildContext ctx) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white,
        ),

        onPressed:()=> createData(ctx),


        child: Text(
          'Register',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildPrice(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Product Price',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (value){
              if(value!.isEmpty){
                String a = 'Price  is required';
                return a ;
              }
              return null;
            },
            onSaved: (input)=> _price = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.price_change,
                color: Colors.white,
              ),
              hintText: 'Enter Product Price',
              hintStyle: hintTextStyle,
            ),

          ),
        ),
      ],
    );
  }
  @override
  void initState() {
    super.initState();

    checkuserstatus();
  }
  void checkuserstatus(){
    try {
      setState(() async {
        //_usereId =  FirebaseAuth.instance.currentUser?.uid ?? null;
      });


    }catch(e){
      print("user is not logged");
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Color(0xfff2f3f7),
      appBar: AppBar(
        title: Text('Add Your Shop'),

      ),

      body: //(_usereId == null)?LoginScreen(list: widget.list!,index: 3,):
      Stack(

        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 11.0,
              ),
              child: Form(
                key: _formkey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Register Your Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ), SizedBox(height: 30.0),
                    imageProfile(),
                    SizedBox(height: 30.0,),
                    _buildWorkshopNameTF(),
                    SizedBox(height: 10,),
                    _buildWorkshopPhoneNoTF(),
                    SizedBox(height: 15,),
                    _buildWorkshopAddressTF(context),
                    SizedBox(height: 10,),
                    _buildPrice(context),
                    SizedBox(height: 10,),
                    _dropdownCategory(),
                    SizedBox(height: 10,),
                    _buildWorkshopDescriptionTF(),
                    SizedBox(height: 10,),

                    SizedBox(height: 10,),
                    _buildRegisterBtn(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _image ==  null?Icon(Icons.add,size :120 ):Image.file(File(_image.path),width: 500,height: 200,),

        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: getImage,
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  void createData(BuildContext context) async {
    if(_formkey1.currentState!.validate()) {
      _formkey1.currentState!.save();

      context.read<ProductService>().postProduct(_name!, _choosedString!, imgfile!,
          _phonenumber!,_address!,_multiline!, _usereId!,_price! ).then((_) {
        Navigator.pushNamed(context,initial);
      });


    }
  }

  showAlertDialog(BuildContext context,String txt1,String txt2) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(txt1),
      content: Text(txt2),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}