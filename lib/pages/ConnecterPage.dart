import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';
import 'package:instagram/navigation.dart';
import 'package:instagram/pages/InscriptionPage.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/screen/home.dart';
import 'package:instagram/screen/profilepage.dart';


class ConnecterPage extends StatefulWidget {
  @override
  State<ConnecterPage> createState() => _ConnecterPageState();
}

class _ConnecterPageState extends State<ConnecterPage> {

  var formkey= GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController= TextEditingController();
  var isObsecure = true.obs;

  Future<void> Connexion() async {
    // Code pour envoyer la note au serveur (utilisez http.post ici)
    if (emailController.text!=""||passwordController.text!="") {
      try {
        var url = 'https://okendi.groupetasnim.com/login.php';
        var response = await http.post(
        Uri.parse(url),
        body: {
        'email': emailController.text,
        'passwor': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
    //print('Connexion réussie !');
    FlutterToastr.show('Connexion reussir', context);
    Navigator.push(
    context,
    MaterialPageRoute(
     builder: (context) => InstagramHomePage(),
    ),
    );
  }
  else {
    //print('Échec de la connexion : ${response.reasonPhrase}');
    FlutterToastr.show('Echec de connexion', context);
  }
      } catch (e) {
        
      }
    }
    else{
      print("remplissez les champs vide");
    }
     
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons){
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [


                  // login
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset(
                      "images/galerie.jpg",
                    ),
                  ),
                  Divider(),
                  // login
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                    
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30,30,30,8),
                        child: Column(
                          children: [
                            Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  //email
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) => val == "" ? " svp! Entrez votre email" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      
                                      hintText: "Entrez votre email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                        
                                  SizedBox(height: 30),
                                  // password
                                  Obx(
                                    () => TextFormField(
                                    controller: passwordController,
                                    obscureText: isObsecure.value,
                                    validator: (val) => val == "" ? " svp! Entrez votre password" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key_sharp,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: Obx(
                                        ()=>GestureDetector(
                                          onTap: (){
                                            isObsecure.value = !isObsecure.value;
                                          },
                                          child: Icon(
                                            isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      hintText: "Entrez votre password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                    ),
                                  SizedBox(height: 30),
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () async {
                                        
                                        Connexion();
                                        
                                        },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "valider",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vous n'avez pas de compte",
                                ),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InscriptionPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Devenez-Membre",
                                    style: TextStyle(
                                      color: Colors.teal,
                                    ),
                                  ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        ),
    );
  }

}