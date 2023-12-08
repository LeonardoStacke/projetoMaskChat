
import 'dart:math';

import 'package:calculadora/models/user.dart';
import 'package:calculadora/provider/firebase_provider.dart';
import 'package:calculadora/services/auth/auth_gate.dart';
import 'package:calculadora/services/auth/auth_service.dart';
import 'package:calculadora/src/bate_papo_page.dart';
import 'package:calculadora/src/calc_page.dart';
import 'package:calculadora/src/controllers/theme_provider.dart';
import 'package:calculadora/src/login_page.dart';
import 'package:calculadora/src/widgets/my_header_drawer.dart';
import 'package:calculadora/src/widgets/timestamp_converter.dart';
import 'package:calculadora/src/widgets/user_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:calculadora/provider/firebase_provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class ConversasPagePlus extends StatefulWidget {
  const ConversasPagePlus({super.key,});


  @override
  State<ConversasPagePlus> createState() => _ConversasPagePlusState();
}

class _ConversasPagePlusState extends State<ConversasPagePlus> {
  @override

  
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();
  signOut() async {

    await _firebaseAuth.signOut().then((user) => 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthGate(isCadastro: false)))
    );
  }

  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  final userData = [
    UserModel(
      name: 'Bruno Guimarães',
      image: 'https://i.pinimg.com/564x/f9/ba/c0/f9bac0d56c1d6b33e50b88fd6a678cfb.jpg', 
      lastActivate: DateTime.now(), 
      uid: '1', 
      email: 'brunogui@gmail.com',
      isOnline: true, 
      codigo: '58632942'),
      

      UserModel(
      name: 'Luana Albuquerque',
      image: 'https://i.pinimg.com/564x/90/c0/97/90c097159b9bf2eac99ed4f5a259ca52.jpg', 
      lastActivate: DateTime.now(), 
      uid: '2', 
      email: 'luanaalb@gmail.com',
      isOnline: false, 
      codigo: '87299468'),

      UserModel(
      name: 'Karen da Silva',
      image: 'https://i.pinimg.com/564x/3c/e1/bd/3ce1bd9a014bb624cb2d22b5cba3adfc.jpg', 
      lastActivate: DateTime.now(), 
      uid: '3', 
      email: 'karensil@gmail.com',
      isOnline: true, 
      codigo: '5519437'),

      UserModel(
      name: 'Lucas Costa',
      image: 'https://i.pinimg.com/564x/5b/76/07/5b7607c7fc22bfabe10cd4ec1431f2f8.jpg', 
      lastActivate: DateTime.now(), 
      uid: '4', 
      email: 'lucascos@gmail.com',
      isOnline: true, 
      codigo: '17421953'),
  ];
  

  Widget build(BuildContext context) {
    var isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: 
      AppBar(
        title: Text("Conversas",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        
        elevation: 0,
        
        
        actions: <Widget>[
          Row(
            children: [
    
              IconButton(
                icon: const Icon(Icons.person_add_alt_1_sharp),
                tooltip: 'Adicionar contato',
                color: Colors.white,
                onPressed: () {
                  showModalBottomSheet(          // Barra que se eleva para adicionar contato
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    builder: (BuildContext context) {
                      
                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 400,
                          decoration: BoxDecoration(

                          ),
                          child: Center(
                            child: Column(
                              
                              children: [
                              
                              SizedBox(height: 10,),
                              Text('Adicionar um novo contato:',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 1,
                                decoration: BoxDecoration(color: Colors.white12),
                              ),
                              SizedBox(height: 20,),
                              
                              TextField(                            //Text Field CODIGO
                                controller: myController,
                                textCapitalization: TextCapitalization.words,
                                maxLength: 8,
                                
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)
                          
                                  ),
                                  floatingLabelStyle: TextStyle(color: Colors.blueAccent, fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: 
                                    BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                      
                                      )),


                                  border: OutlineInputBorder(
                                    
                                    borderRadius: BorderRadius.circular(14),
                                    
                                    borderSide: BorderSide()
                                  ),
                                  suffixIcon: Icon(Icons.connect_without_contact),
                                  hintText: 'Digite...',
                                  labelText: 'Código: ',
                                ),
                              ),
                      
                              SizedBox(height: 25,),

                              TextField(                            //Text Field NOME
                                controller: myController2,
                                textCapitalization: TextCapitalization.words,
                                maxLength: 21,
                                

                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)
                          
                                  ),
                                  
                                  floatingLabelStyle: TextStyle(color: Colors.blueAccent, fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: 
                                    BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                      
                                      )),

                                  border: OutlineInputBorder(
                                    
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  suffixIcon: Icon(Icons.person),
                                  hintText: 'Digite...',
                                  labelText: ('Nome: '),
                                  
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(                        // Botão de Salvar
                                children: [
                                  Expanded(child: 
                      
                                  Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                                        
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      
                                      
                                     child: Text('Salvar', style: TextStyle(color: Colors.white),),
                                     ),
                                  )
                                  ,),
                                  
                                ],
                              ),
                              ElevatedButton(               // Botão de Cancelar
                                    onPressed: (){
                                    Navigator.pop(context);
                                    setState(() {
                                      myController.clear();
                                      myController2.clear();
                                    });
                                  }, 
                                  
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(0, 0, 255, 0),
                                    
                                    onPrimary: Colors.black,
                                    
                                    elevation: 0,
                                    
                                  ),
                                  child: 
                                  Text(
                                    'Cancelar',
                                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                                    )
                                  )
                            ],
                            
                          )
                            
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    color: Colors.white,
                    tooltip: 'Definições',
                    onPressed:(){
                      Scaffold.of(context).openEndDrawer();
                      });
                }
              ),
            ],
          )
          
        ],
      ),
      
      
      floatingActionButton: 
      SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          
          onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalcPage(isCadastro: false,)),
          );
          },
          child: 
          const Icon(Icons.calculate_rounded, size: 40,color: Colors.white,),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          
        ),
      ),
      endDrawer: Drawer(                           //SideBar configurações
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(40))),
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Theme.of(context).colorScheme.onBackground,
                leading: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode),
                title:  Text(isDarkTheme ? 'Tema escuro' : 'Tema claro'),
                onTap: (){
                    print('Entrou no botao');
                    print(MediaQuery.of(context).platformBrightness);
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    print('Saiu do botao');
                    print(MediaQuery.of(context).platformBrightness);
                },
                
              ),
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Theme.of(context).colorScheme.onBackground,
                leading: const Icon(Icons.person),
                title: const Text('Minha conta'),
                onTap: (){

                },
                
              ),
              
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Theme.of(context).colorScheme.onBackground,
                leading: const Icon(Icons.group),
                title: const Text('Contatos'),
                onTap: (){

                },
                
              ),
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Theme.of(context).colorScheme.onBackground,
                leading: const Icon(Icons.share),
                title: const Text('Compartilhar'),
                onTap: (){

                },
                
              ),
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Theme.of(context).colorScheme.onBackground,
                leading: const Icon(Icons.shield_moon),
                title: const Text('Política de privacidade'),
                onTap: (){

                },
                
              ),
              
              SizedBox(height: 10,),
              Container(
                height: 1,
                color: const Color.fromARGB(255, 90, 90, 90),
              ),
              SizedBox(height: 10,),
              ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                iconColor: Colors.red,
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: signOut
                
              ),
            ],
          ),
        ),
      ),
      body:
        Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 15,),
          Expanded(child:
          StreamBuilder<QuerySnapshot>(stream: users,
           builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot>snapshot,
            ){
              if(snapshot.hasError){
                return Text('Algo deu errado');
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Text('Carregando');
              }

              final data = snapshot.requireData;

              return Container(
            
            decoration: BoxDecoration(
              color:  Theme.of(context).colorScheme.background,

              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
            ),

            
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: data.size,
                separatorBuilder:(context, index) => 
                  const SizedBox(height: 5,),
                physics: const BouncingScrollPhysics(),
                
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>BatePapoPage(userId: data.docs[index]['uid'], documentSnapshot: documentSnapshot,)));
                  },
                  child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(alignment:Alignment.bottomRight,
                  children: [CircleAvatar(
                    radius: 30,
                    backgroundImage: 
                      NetworkImage(data.docs[index]['image']),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child:  
                    CircleAvatar(
                          backgroundColor: data.docs[index]['isOnline']
                          ? Colors.green 
                          : Colors.grey,
                          radius: 5,
                  ),
                  )
                
                  ]
                  ),
                  title: Text(
                    data.docs[index]['name'],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    'Último acesso : '+ timeConverter(data.docs[index]['lastActivate']) 
                  ),
                ),
                );
                }
                          )
                      );
                        },)
                        
                        )
                      ]
                        )
                    
                    )
                    
                    
                  );
                  
                }
              }

class ContainerConversa extends StatelessWidget {
  final String nome;
  final String foto;
  final int notificacao;
  final Color? color;
  final void Function(String value)? onTap;

  const ContainerConversa({super.key, required this.nome, required this.foto, required this.notificacao, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = this.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(title: 'BOM DIA')),
        ),
        child: Column(
          
        
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            padding: EdgeInsets.all(8),
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent
              
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    child: 
                    Icon(
                        Icons.person,
                        color: color,
                    ),
                
                  ),
                  SizedBox(width: 8,),
                  Text(
                    nome,
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10,),
                  
                      Visibility(
                        visible: notificacao>0,
                  
                        child: 
                        Expanded(    
                          child: 
                          Row(    
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    '$notificacao',
                                    style: TextStyle(color: Colors.white,),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 3, 165, 214),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                        ),
                            ],
                          )
                        )
                      )
                      
                    ]
                  
              ),
            ),
    ),
        ],
      ),
      )
      );
  }
}


