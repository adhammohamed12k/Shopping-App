import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuz_adham_mohamed/Providers/App%20Provider.dart';
import 'package:qiuz_adham_mohamed/Providers/Product-Provider.dart';
import 'package:qiuz_adham_mohamed/Screen/Products-Page.dart';
import 'Screen/SignUp-Page.dart';
import 'Widget/Item-Product.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
            ChangeNotifierProvider(create: (context)=> AppProvider()),
        ChangeNotifierProvider(create: (context)=> ProductProvider()),
      ],
      child: const MaterialApp(
          home: MySignUpPage(),
        ),
    );
  }
}
