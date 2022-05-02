
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:rms/Config.dart';
import 'package:rms/Page_1.dart';



class registerPerson extends StatefulWidget {
  final  refresh;
  const registerPerson({Key? key,this.refresh}) : super(key: key);

  @override
  State<registerPerson> createState() => _registerPersonState();
}

class _registerPersonState extends State<registerPerson> {

  TextEditingController NameCtrl = TextEditingController();
  TextEditingController NumberCtrl = TextEditingController();
  TextEditingController AadharCtrl = TextEditingController();

  static final formkey = GlobalKey<FormState>();
  static AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  static var selectValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xffFF6262),
        bottomSheet: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              color: Color(0xffFF6262),
              padding: EdgeInsets.symmetric(
                  vertical: Get.width * 0.1, horizontal: Get.width * 0.025),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Register Person', style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                    ],),
                  SizedBox(height: Get.width * 0.035,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width * 0.25, child: Text(
                            'Name', style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width * 0.1, child: Text(
                            ':', style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width * 0.53,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              controller: NameCtrl,
                              autovalidateMode: _autovalidateMode,
                              validator: showError,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffae0000),
                                      width: Get.width * 0.0032),),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width * 0.25, child: Text(
                            'Number', style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width * 0.1, child: Text(
                            ':', style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width * 0.53,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              controller: NumberCtrl,
                              autovalidateMode: _autovalidateMode,
                              validator: showError,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffae0000),
                                      width: Get.width * 0.0032),),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width * 0.25, child: Text(
                            'Aadhar', style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width * 0.1, child: Text(
                            ':', style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width * 0.53,
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              style: TextStyle(color: Colors.white),
                              controller: AadharCtrl,
                              autovalidateMode: _autovalidateMode,
                              validator: showError,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Aadhar Number',
                                hintStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffae0000),
                                      width: Get.width * 0.0032),),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfff13535))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width * 0.025),


                    ],
                  ),
                  Container(
                    width: Get.width * 0.25,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            _autovalidateMode = AutovalidateMode.disabled;

                            submitRequest();
                          } else {
                            _autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        child: Text('Submit', style: TextStyle(color: Color(
                            0xfff13535)),)),
                  ),
                  // SizedBox(height: Get.width*0.025,),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }

  static var showError = (isvalue) {
    if (isvalue == "") {
      return 'Required Field*';
    }
    return null;
  };

  Future<void> submitRequest() async {
    print('Jai Balaya');
    String router = 'registerPerson';
    var token = await secStorage.read(key: 'token',);

    Map<String,dynamic> info ={
      "name" : NameCtrl.text,
      "mobile" : NumberCtrl.text,
      "aadhar" : AadharCtrl.text,
      'token'  : token,
    };

    var  RequestUrl = Uri.parse(DASHBOARD_URL + router);
    print(RequestUrl);

    print("checking request body info : $info");

    http.Response response = await http.post(RequestUrl,body: info,);
    print(response.statusCode);

    var submitinfo =jsonDecode(response.body);
    print(submitinfo);
    if(response.statusCode == 200){
      if(submitinfo['status']){
        showDialog(context:  context,builder: (context)=>AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Success'),
          content: Text("${submitinfo['msg']}"),
          actions: [
            TextButton(onPressed: (){
              resetData();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              widget.refresh();

            },
                child: Text('OK',style: TextStyle(color: Colors.blueAccent),)),
          ],
        ));


      }else{
        showDialog(context:  context,builder: (context)=>AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Error'),
          content: Text("${submitinfo['msg']}"),
          actions: [
            TextButton(onPressed: ()=>Navigator.of(context).pop(),
                child: Text('OK',style: TextStyle(color: Colors.blueAccent),)),
          ],
        ));
      }

    }else{
      showDialog(context: context, builder: (context)=>AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Error'),
        content: Text(' Not Found ${response.statusCode}'),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(),
            child:Text('OK',style: TextStyle(color: Colors.blueAccent,),),),
        ],
      ),);
    }

  }

  void resetData() {
    NameCtrl.text = '';
    NumberCtrl.text = '';
    AadharCtrl.text = '';
  }

  // Future <void> submitRequest() async {
  //   String router = 'registerPerson';
  //   var token = await secStorage.read(key: 'token',);
  //
  //   Map <String, dynamic> submitinfo = {
  //     "name": NameCtrl.text,
  //     "mobile": NameCtrl.text,
  //     "aadhar": AadharCtrl.text,
  //     "token": token,
  //   };
  //   var submitUrl = Uri.parse(DASHBOARD_URL + router);
  //   print(submitUrl);
  //
  //   http.Response response = await http.post(submitUrl, body: submitinfo,);
  //   print(response.statusCode);
  //
  //   var subinfo = jsonDecode(response.body);
  //   print(subinfo);
  //
  //   if (response.statusCode == 200) {
  //     if (submitinfo['status']) {
  //       // showDialog(context: context, builder: (context) =>
  //       //     AlertDialog(
  //       //       backgroundColor: Colors.white,
  //       //       title: Text('Success'),
  //       //       content: Text("${submitinfo['msg']}"),
  //       //       actions: [
  //       //         TextButton(onPressed: () => Navigator.of(context).pop(),
  //       //             child: Text(
  //       //               'OK', style: TextStyle(color: Colors.blueAccent),)),
  //       //       ],
  //       //     ));
  //     } else {
  //       showDialog(context: context, builder: (context) =>
  //           AlertDialog(
  //             backgroundColor: Colors.white,
  //             title: Text('Error'),
  //             content: Text('${submitinfo["msg"]}'),
  //             actions: [
  //               TextButton(onPressed: () => Navigator.of(context).pop(),
  //                 child: Text(
  //                   '0K', style: TextStyle(color: Colors.blueAccent),),),
  //             ],
  //
  //           ));
  //     }
  //   } else {
  //     showDialog(context: context, builder: (context) =>
  //         AlertDialog(
  //           backgroundColor: Colors.white,
  //           title: Text('Error'),
  //           content: Text('Data Not Recorded ${response.statusCode}'),
  //           actions: [
  //             TextButton(onPressed: () => Navigator.of(context).pop(),
  //                 child: Text(
  //                   'OK', style: TextStyle(color: Colors.blueAccent),)),
  //           ],
  //         ));
  //   }
  //
  //
  // }
  }
