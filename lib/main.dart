import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_review/review/review_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:food_review/sign_in/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("form_data_box");
  await Hive.openBox("user_data_box");

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final _userDataBox = Hive.box('user_data_box');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _userDataBox.get('token') != null?
      const ReviewScreen():
       const SignIn()
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

