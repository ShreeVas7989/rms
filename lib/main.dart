
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rms/Page_1.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
          color: Color(0xffae0000),
          child:Text('RMS',
            style:  GoogleFonts.yuseiMagic(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 35),
          ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text("RMS",style: TextStyle(fontSize: 25),),backgroundColor: Color(0xfff13535),),
        body: Center(
            child:Text("Screen-1",textScaleFactor: 2,),
        ),
        drawer: Drawer(
          backgroundColor: Color(0xfff13535),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: Get.width*0.045),
            child: Column(
              children: [
                Container(
                  width: Get.width*0.3,
                  height: Get.width*0.2,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(image: DecorationImage
                    (image: NetworkImage('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg'),),
                      shape: BoxShape.circle),
                ),
                SizedBox(height: Get.width*0.025,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: Get.width*0.05,),
                    SizedBox(width: Get.width*0.15,
                      child:Text('Name',style: TextStyle(color: Colors.white),),),
                    SizedBox(width: Get.width*0.1,child: Text(':',style: TextStyle(color: Colors.white),),),
                    Expanded(child: SizedBox(width: Get.width*0.35,child: Text('Srimusuru Anasurya',style: TextStyle(color: Colors.white),),)),
                  ],
                ),
                SizedBox(height: Get.width*0.025,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: Get.width*0.05,),
                    SizedBox(width: Get.width*0.15,
                      child:Text('Code',style: TextStyle(color: Colors.white),),),
                    SizedBox(width: Get.width*0.1,child: Text(':',style: TextStyle(color: Colors.white),),),
                    Expanded(child: SizedBox(width: Get.width*0.35,child: Text('612',style: TextStyle(color: Colors.white),),)),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Get.width*0.05,horizontal: Get.width*0.02),
                  child: TextFormField(style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(hintText: 'Modules Search...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25),),borderSide: BorderSide(color: Colors.white),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25),),borderSide: BorderSide(color: Colors.white),),
                  prefixIcon: Icon(Icons.article_outlined,color: Colors.white,),
                    suffixIcon: Icon(Icons.search,color: Colors.white,),),
                  ),
                ),
                ExpansionTile(leading: Icon(Icons.article,color: Colors.white,),
                  title: Text('Manage Person',style: TextStyle(color: Colors.white,fontSize: 16),),
                  children: <Widget>[
                    ListTile(title: TextButton(onPressed: (){
                      Get.to(page_1());
                    },child: Row(
                      children: [
                        Container(
                         width: Get.width*0.12,
                          height: Get.width*0.02,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),),
                        Text('Manage Person - 1',style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    ),),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
