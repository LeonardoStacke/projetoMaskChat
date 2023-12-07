
import 'dart:math';

import 'package:calculadora/src/bate_papo_page.dart';
import 'package:calculadora/src/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConversasPage extends StatefulWidget {
  const ConversasPage({super.key});

  @override
  State<ConversasPage> createState() => _ConversasPageState();
}

class _ConversasPageState extends State<ConversasPage> {
  @override
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  Widget build(BuildContext context) {
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
      appBar: 
      AppBar(
        title: Text("Conversas",
          style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
        ),
        
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Configurações',
                onPressed:(){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Configurações')));
                  }),
              IconButton(
                icon: const Icon(Icons.person_add_alt_1_sharp),
                tooltip: 'Adicionar contato',
                onPressed: () {
                  showModalBottomSheet(          // Barra que se eleva para adicionar contato
                    isScrollControlled: true,
                    context: context,
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
                                // decoration: BoxDecoration(color: Colors.white12),
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
                                    style: TextStyle(color: Theme.of(context).primaryColorLight),
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
            ],
          )
          
        ],
      ),

      body: 
      Container(
        decoration: BoxDecoration(
          color: Colors.black
        ),

        
        child: Column(
          
          children: [
            
            ContainerConversa(
              nome: 'Leonardo Stacke', 
              foto: 's', 
              notificacao: 3,
              // color: Colors.white,
              ),
      
              
              ContainerConversa(
              nome: 'Maria da Silva', 
              foto: 's', 
              notificacao: 0,
              color: Colors.purple,
              ),
              ContainerConversa(
              nome: 'João Carlos', 
              foto: 's', 
              notificacao: 1,
              color: Colors.red,
              ),
              ContainerConversa(
              nome: 'Bruna Costa', 
              foto: 's', 
              notificacao: 5,
              color: Colors.blueAccent,),
             
          ],
        ),
      ),
    ),
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
    // final color = this.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.red,
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
              color: Colors.black
              
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
