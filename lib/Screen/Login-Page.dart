import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuz_adham_mohamed/Providers/App%20Provider.dart';
import 'package:qiuz_adham_mohamed/Screen/Login-Page.dart';
import 'package:qiuz_adham_mohamed/Screen/SignUp-Page.dart';

import 'Products-Page.dart';
class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    var fromKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),centerTitle: true,),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return  Form(
              key: fromKey,
              child: Container(
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: email,
                        decoration:  InputDecoration(
                            labelText: "Your Email",
                            icon: Icon(Icons.email),
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(12))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty)
                          {
                            return "plz fill your Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        obscureText: true,
                        controller: password,
                        decoration:  InputDecoration(
                            labelText: "Your Password",
                            icon: Icon(Icons.password),
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(12))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty)
                          {
                            return "plz fill your Phone";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      OutlinedButton(
                        onPressed: ()async{
                          if(fromKey.currentState!.validate())
                          {
                            bool signup = await Provider.of<AppProvider>
                              (context,listen: false).fetchDataLogin(
                                email.text,
                                password.text
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyProducts()));
                          }
                          else
                          {
                            const ScaffoldMessenger(child: Text("Error"),);
                          }
                        },
                        child:const Text("Login"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("you have an account ?"),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MySignUpPage()));
                            },
                            child:const Text("SignUp"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
          );
        },

      ),
    );
  }
}
