

import 'package:calculadora/services/auth/auth_service.dart';
import 'package:calculadora/src/cadastro_page.dart';
import 'package:calculadora/src/calc_page.dart';
import 'package:calculadora/src/conversas_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  
 

  @override
  Widget build(BuildContext context) {
    signIn() async {

    try {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        );

        if (userCredential != null){
          print('Acessou');
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalcPage(isCadastro: false,)),
        );
        }
        // Navegar para a próxima página após o login bem-sucedido, se necessário
      }on FirebaseAuthException catch(e){
        if(e.code == 'user-not-found'){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuario nao econtrado'))
          );
        }else if(e.code == 'wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Senha incorreta'))
          );
        }
      }
    } 
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 29, 2, 77),
            Color.fromARGB(222, 238, 42, 241),
          ],
        ),
      ),
    child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,      
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bem vindo de volta ao',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const Text(
              'MaskChat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),

                Column(
                  children: [
                    TextFormField(controller: emailController,
                    validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Por favor, insira um e-mail válido",
                      decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)
                            )
                          ),
                    ),
                    SizedBox(height: 20,),
                    
                    TextFormField(controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                    obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              ),focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)
                            )
                          ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      
                      signIn();
                    }, child: Container(   
                      alignment: Alignment.center, 
                      width: 200,
                      child: Text('Entrar', style: TextStyle(fontSize: 20),))),

                    ElevatedButton(
                      
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                      
                      onPressed: (){
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CadastroPage()),
                        );
                    }, child: Container(   
                      alignment: Alignment.center, 
                      
                      decoration: BoxDecoration(
                        color: Colors.transparent
                      ),
                      width: 100,
                      child: Text('Criar conta', style: TextStyle(fontSize: 14, color: Colors.white, decoration: TextDecoration.underline),))),
                  ],
                )

          ],
        ),
      ),
    )
    );
  }
}
