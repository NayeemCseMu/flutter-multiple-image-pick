import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/upload_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Multi Image Pick',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: UploadScreens(),
    );
  }
}
