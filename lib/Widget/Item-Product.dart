import 'package:flutter/cupertino.dart';

class Itemproduct extends StatelessWidget {
  String img;
  String name;
  String disc;
  dynamic price;
   Itemproduct({required this.img , required this.name , required this.disc,required this.price});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(img),
         const SizedBox(height: 20,),//نوع datatype بيقبل كل الانواع
          Text(name),
          const SizedBox(height: 20,),
          Text(disc),
          const SizedBox(height: 20,),
          Text("$price"),
        ],
      ),
    );
  }
}
