import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDetailsPage extends StatelessWidget {
  String img ;
  String name;
  String disc;
   MyDetailsPage({required this.img , required this.name , required this.disc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Image.network(img),
              const SizedBox(height: 20,),
              Text(name),
              const SizedBox(height: 20,),
              Text(disc),
            ],
          ),
      ),
    );
  }
}
