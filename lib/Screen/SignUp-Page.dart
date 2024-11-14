import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiuz_adham_mohamed/Providers/App%20Provider.dart';
import 'package:qiuz_adham_mohamed/Screen/Login-Page.dart';
class MySignUpPage extends StatelessWidget {
  const MySignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    //any 
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    var fromKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp"),centerTitle: true,),
      body: Consumer<AppProvider>(
        builder: (context, value, child){
          return  Form(
              key: fromKey,
              child: Container(
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            labelText: "Your Name",
                            icon: const Icon(Icons.person),
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(12))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty)
                          {
                            return "plz fill your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: phone,
                        decoration:  InputDecoration(
                            labelText: "Your Phone",
                            icon: Icon(Icons.phone),
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
                              (context,listen: false).fetchDataSignup(
                                name.text,
                                phone.text,
                                email.text,
                                password.text
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyLoginPage()));
                          }
                          else
                          {
                            const ScaffoldMessenger(child: Text("Error"),);
                          }
                        },
                        child:const Text("Sign Up"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("you have an account ?"),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyLoginPage()));
                            },
                            child:const Text("Login"),
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
