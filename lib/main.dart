import 'package:flutter/material.dart';
import 'package:flutter_application_41/pages/home.page.dart';
import 'package:flutter_application_41/tools/textter.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox(AppTexts.Mybox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
