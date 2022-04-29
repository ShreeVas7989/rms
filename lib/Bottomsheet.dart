import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class validation extends StatefulWidget {
  const validation({Key? key}) : super(key: key);

  @override
  State<validation> createState() => _validationState();
}

class _validationState extends State<validation> {

  TextEditingController NameCtrl = TextEditingController();
  TextEditingController NumberCtrl = TextEditingController();
  TextEditingController uploadCtrl = TextEditingController();

  static  final formkey = GlobalKey<FormState>();
  static AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  static var  selectValue = ''  ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xffFF6262),
        bottomSheet: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              color: Color(0xffFF6262),
              padding: EdgeInsets.symmetric(vertical: Get.width*0.08,horizontal: Get.width*0.025),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [ Text('Add Person',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),],),
                  SizedBox(height: Get.width*0.02,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width*0.25,child: Text('Name',style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width*0.1,child: Text(':',style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width*0.53,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: NameCtrl,
                              autovalidateMode: _autovalidateMode,
                              validator: showError,
                              keyboardType: TextInputType.text,
                              decoration:InputDecoration(
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(color: Colors.white,),
                                errorStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width*0.25,child: Text('Number',style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width*0.1,child: Text(':',style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width*0.53,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: NumberCtrl,
                              autovalidateMode: _autovalidateMode,
                              validator: showError,
                              keyboardType: TextInputType.number,
                              decoration:InputDecoration(
                                hintText: 'Number',
                                hintStyle: TextStyle(color: Colors.white,),
                                errorStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Get.width*0.25,child: Text('Upload File',style: TextStyle(color: Colors.white),),),
                          SizedBox(width: Get.width*0.1,child: Text(':',style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width: Get.width*0.57,
                            child: TextButton(onPressed: (){
                              //  select file
                            },
                              child: TextFormField(
                                controller: uploadCtrl,
                                autovalidateMode: _autovalidateMode,
                                validator: showError,
                                keyboardType: TextInputType.none,
                                showCursor: false,
                                decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.upload_file,color:Color(0xff173772) ,),
                                  hintText: 'No file choosen',
                                  hintStyle: TextStyle(color: Colors.white,),
                                  errorStyle: TextStyle(color: Colors.amber),
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                ),
                                onTap: ()async {
                                  FilePickerResult? myFile = await FilePicker.platform.pickFiles();

                                  if(myFile != null ){
                                    print('Selected file : ${myFile.files.first.name}');
                                    uploadCtrl.text = myFile.files.single.name;
                                  }else {
                                    print('file not selected');
                                  }

                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: Get.width*0.025),


                    ],
                  ),
                  Container(
                    width: Get.width*0.25,
                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: (){
                          print(selectValue);
                          print(NameCtrl.text);
                          // node.unfocus();
                          if(formkey.currentState!.validate()){
                            print('Jai Balaya validation Success>>>>');
                            _autovalidateMode = AutovalidateMode.disabled;

                          }else {
                            _autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        child: Text('Submit',style: TextStyle(color: Color(0xfff13535)),)),
                  ),
                  // SizedBox(height: Get.width*0.025,),
                ],
              ) ,
            ),
          ),
        ),

      ),
    );
  }
  static var showError = (isvalue){
    if(isvalue == ""){
      return 'Required Field*';
    }
    return null;
  };
}
