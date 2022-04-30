
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rms/Page_1.dart';
import 'Config.dart';
import 'package:http/http.dart' as http;
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
    checkLoginToken();

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

  void checkLoginToken() async {

    await hasToken() ? Timer(Duration(seconds: 2), ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondScreen()))) :
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login()
              // SecondScreen()
            )
        )
    );
  }
}



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController NameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();


  static  final formkey = GlobalKey<FormState>();
  static AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  static var  selectValue = ''  ;


  @override
  Widget build(BuildContext context) {
    return SafeArea
      (child: Scaffold(
      backgroundColor: Color(0xffae0000),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: Get.width*0.25,horizontal: Get.width*0.15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('RMS',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: Get.width*0.15,),
                Container(
                  width: Get.width*0.75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15),),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: Get.width*0.09,horizontal: Get.width*0.03),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Color(0xffae0000)),
                          controller: NameCtrl,
                          autovalidateMode: _autovalidateMode,
                          validator: showError,
                          keyboardType: TextInputType.text,
                          decoration:InputDecoration(
                            hintText: 'User Name',
                            hintStyle: TextStyle(color: Color(0xffae0000),),
                            contentPadding: EdgeInsets.symmetric(horizontal: Get.width*0.025,),
                            prefixIcon: Container(
                              // height: Get.width*0.12,
                              padding: EdgeInsets.symmetric(vertical: Get.width*0.039),
                              decoration: BoxDecoration(
                                color: Color(0xffae0000),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Icon(Icons.person,color: Colors.white,size: 25),
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                          ),
                        ),
                        SizedBox(height: Get.width*0.05,),
                        TextFormField(
                          style: TextStyle(color: Color(0xffae0000)),
                          controller: passwordCtrl,
                          autovalidateMode: _autovalidateMode,
                          validator: showError,
                          keyboardType: TextInputType.number,
                          decoration:InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xffae0000),),
                            contentPadding: EdgeInsets.symmetric(horizontal: Get.width*0.025,),
                            prefixIcon: Container(
                              // height: Get.width*0.12,
                              padding: EdgeInsets.symmetric(vertical: Get.width*0.039),
                              decoration: BoxDecoration(
                                color: Color(0xffae0000),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Icon(Icons.lock,color: Colors.white,size: 25),
                            ),
                              suffixIcon: Icon(Icons.remove_red_eye,color: Color(0xffae0000),),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                          ),
                        ),
                        SizedBox(height: Get.width*0.05,),
                        Container(
                          width: Get.width*0.35,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),), color: Color(0xffae0000),),
                         child: TextButton(
                           onPressed: (){

                               if(formkey.currentState!.validate()){
                                 _autovalidateMode = AutovalidateMode.disabled;

                                 loginReq();




                               }else {
                                 _autovalidateMode = AutovalidateMode.always;
                               }
                           },
                           child: Text('Login',style: TextStyle(color: Colors.white),),
                         ),
                        ),

                        TextButton(onPressed: (){},
                            child: Text('Forgot Password...?',style: TextStyle(color: Color(0xffae0000),),)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  static var showError = (isvalue){
    if(isvalue == ""){
      return 'Required Field*';
    }
    return null;
  };

  Future<void> loginReq() async {

    String segment = 'login/handlelogin';

    Map<String,dynamic> data = {
          "username" : NameCtrl.text,
          "pwd" : passwordCtrl.text
    };

    var reqUrl = Uri.parse(BASE_URL + segment) ;
    
    http.Response response = await http.post(reqUrl,body: data,);
    print(response.statusCode);

        var respData = jsonDecode(response.body);
        print(respData);
         if(response.statusCode == 200){
            if(respData['status']){
              print('success login : ${respData['token']}');
              var token = respData['token'] ;
                await secStorage.readAll(aOptions: getAndroidOptions());
              await secStorage.write(key: 'token', value: token );

              Get.to(SecondScreen());

            }else {
              showDialog(context: context, builder: (context)=>AlertDialog(
                backgroundColor: Colors.white,
                title: Text('Error'),
                content: Text(" ${respData['msg']}"),
                actions: [
                  TextButton(onPressed: ()=>Navigator.of(context).pop(),
                      child: Text('OK',style: TextStyle(color: Colors.blueAccent),))
                ],
              ));
            }


         }else {
          showDialog(context: context, builder: (context)=>AlertDialog(
            backgroundColor: Colors.white,
              title: Text('Error'),
            content: Text("Page Not Found ${response.statusCode}"),
            actions: [
              TextButton(onPressed: ()=>Navigator.of(context).pop(),
                  child: Text('OK',style: TextStyle(color: Colors.blueAccent),))
            ],
          ));
         }



  }
}






class SecondScreen extends StatefulWidget {

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  bool? isLoading = false;
  List<Widget> perList = [];

  @override
  void initState() {
    super.initState();
    getPersonList();
  }

  @override
  Widget build(BuildContext context) {
    checkTok();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text("RMS",style: TextStyle(fontSize: 25),),backgroundColor: Color(0xfff13535),),
        body: Column(
children: [
  isLoading! ? Center(
            child: CircularProgressIndicator()
        ) : Column(
          children: perList,
        ),
  Container(
    width: Get.width*0.35,
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),), color: Color(0xfff13535),),
    child: TextButton(
      onPressed: (){
        // if(formkey.currentState!.validate()){
        //   _autovalidateMode = AutovalidateMode.disabled;
        //
        //   loginReq();
        //
        //
        //
        //
        // }else {
        //   _autovalidateMode = AutovalidateMode.always;
        // }
      },
      child: Text('LogOut',style: TextStyle(color: Colors.white,fontSize: 20),),
    ),
  ),
   ],
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

  void checkTok() async {
    var getToken = await secStorage.read(key: "token");
    print('second Screen token : $getToken');
  }

  Future<void> getPersonList() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(milliseconds: 600));

    String segment = DASHBOARD_URL + 'PersonsList';
    var getToken = await secStorage.read(key: "token");
    var data = {
      'token' : getToken
    };

    var personListUri = Uri.parse(segment);

     var response = await http.post(personListUri,body: data,);

     print("person List : ${response.body}");

     var respData = jsonDecode(response.body);

     // if(response.statusCode == 200)
      if(respData['status']) {


       List personListData =  respData['persons'];

       personListData.forEach((element) {

         String name = element['name'];
         String mobile = element['mobile'];
         String aadgar = element['aadhar'];

         perList.add(Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         child: ListTile(
             title: Text(name),
           subtitle: Text(mobile),
           trailing: Text(aadgar),
           ),
         ),
         );
       });


      }else {

        perList.clear();
        perList.add(Text('Data Not Found'));

      }



    setState(() {
      isLoading = false;
    });

  }
}
