import 'package:flutter/material.dart';
import 'package:get/get.dart';

class page_1 extends StatelessWidget {
  const page_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screen_1();
  }
}

class screen_1 extends StatefulWidget {
  const screen_1({Key? key}) : super(key: key);

  @override
  State<screen_1> createState() => _screen_1State();
}

class _screen_1State extends State<screen_1> {

  TextEditingController NameCtrl = TextEditingController();
  TextEditingController NumberCtrl = TextEditingController();
  TextEditingController uploadCtrl = TextEditingController();

  static  final formkey = GlobalKey<FormState>();
  static AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  static var  selectValue = ''  ;

  @override
  Widget build(BuildContext context) {
    final  node = FocusScope.of(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Color(0xfff13535),title: Center(child: Text('Manage Persons')),),
          body: Form(
            key: formkey,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: Get.width*0.045,horizontal: Get.width*0.01),
              child: Column(
                children: const [
                   ListTile(leading: CircleAvatar(
                     backgroundImage: NetworkImage('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg'),
                   ),
                     title: Expanded(child: Text('Srimusuru Anasurya'),),
                   subtitle: Expanded(child: Text('9293457758'),),
                     trailing: Text('28-04-2022'),
                   ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xffFF6262),
            child:  TextButton(onPressed: (){
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: const Color(0xffFF6262) ,

                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: Get.width*0.08,horizontal: Get.width*0.025),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [ Text('Add Person',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),],),
                        SizedBox(height: Get.width*0.023,),
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
                                      border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.width*0.05),
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
                                      border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.width*0.05),
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
                                        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffae0000),width: Get.width*0.0032),),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff13535))),
                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: Get.width*0.05),


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
                                node.unfocus();
                                if(formkey.currentState!.validate()){
                                  print('Jai Balaya validation Success>>>>');
                                  _autovalidateMode = AutovalidateMode.disabled;

                                }else {
                                  _autovalidateMode = AutovalidateMode.always;
                                }
                              },
                              child: Text('Submit',style: TextStyle(color: Color(0xfff13535)),)),
                        ),
                      ],
                    ) ,
                  );
                },
              );
            },child: Icon(Icons.add,color: Colors.white,)),
          ),

        ));
  }
  static var showError = (isvalue){
    if(isvalue == ""){
      return 'Required Field*';
    }
    return null;
  };
}
