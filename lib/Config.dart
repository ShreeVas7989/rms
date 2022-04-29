


import 'package:flutter_secure_storage/flutter_secure_storage.dart';



const BASE_URL = "http://lozicalcoder.com/" ;

var secStorage = FlutterSecureStorage();
AndroidOptions getAndroidOptions() => const AndroidOptions(
  encryptedSharedPreferences: true,
);