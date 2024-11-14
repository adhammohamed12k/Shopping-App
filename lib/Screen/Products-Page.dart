import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuz_adham_mohamed/Providers/Product-Provider.dart';
import 'package:qiuz_adham_mohamed/Screen/Details-Page.dart';
import 'package:qiuz_adham_mohamed/Widget/Item-Product.dart';
class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Products"),),
      body: Consumer<ProductProvider>(
        builder: (context, value,child) {
          var models = value.productModel;
          if(models == null)
            {
              value.fetchData();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else
            {
              return GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context , index)
                {
                  return GestureDetector(
                    child: Itemproduct(
                      img: models.data[index]['image'],
                      name: models.data[index]['name'],
                      disc: models.data[index]['description'],
                      price: models.data[index]['price'],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDetailsPage(
                        img: models.data[index]['image'],
                        name: models.data[index]['name'],
                        disc: models.data[index]['description'],
                      )
                      )
                      );
                    },
                  );
                },
                itemCount:models.data.length,
              );
            }

        },
      )
    );
  }
}
