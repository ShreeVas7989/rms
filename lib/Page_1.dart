import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rms/Bottomsheet.dart';

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
        child: SingleChildScrollView(
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
                    return validation();
                  },
                );
              },child: Icon(Icons.add,color: Colors.white,)),
            ),

          ),
        ));
  }

}
