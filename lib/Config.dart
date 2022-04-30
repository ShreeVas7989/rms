


import 'package:flutter_secure_storage/flutter_secure_storage.dart';



const BASE_URL = "http://lozicalcoder.com/" ;

const DASHBOARD_URL = BASE_URL + 'dashboard/';

var secStorage = FlutterSecureStorage();

AndroidOptions getAndroidOptions() => const AndroidOptions(
  encryptedSharedPreferences: true,
);

Future<bool> hasToken()async{
  var getToken = await secStorage.read(key: "token");
  bool isValidToken = false;
  isValidToken = getToken != null && getToken != '' ? true : false;
  return isValidToken;
}