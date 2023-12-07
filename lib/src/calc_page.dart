import 'package:calculadora/provider/firebase_provider.dart';
import 'package:calculadora/src/controllers/calc_controller.dart';
import 'package:calculadora/src/conversas_page.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/src/widgets/display.dart';
import 'package:calculadora/src/widgets/button_hub.dart';
import 'package:calculadora/src/conversas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
bool mostrarAviso = false;
String senhaCalc = '';

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  bool popUpShown = false;
  final controller = CalcController();
  final myController = TextEditingController();

  Future<void> _checkAndNavigate(BuildContext context) async {
    // Recupera a senhaCalc da memória local
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedSenhaCalc = prefs.getString('senhaDeAcesso') ?? '';
    print('Senha $savedSenhaCalc');

    // Chama mostrarPopUp se a senha ainda não estiver definida
    if (savedSenhaCalc.isEmpty) {
      mostrarPopUp(context);
    } else {
      if (controller.clickValue == '√' && controller.display == savedSenhaCalc) {
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConversasPagePlus()),
        );
        controller.display = '0';
      } else {
        // Lida com a senhaCalc incorreta
      }
    }
  }

  Future<void> _saveSenhaCalcInLocalStorage(String senhaCalc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('senhaDeAcesso', senhaCalc);
  }

  Future<void> mostrarPopUp(BuildContext context) async {
    popUpShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Bem-vindo ao MaskChat!',
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Crie uma senha que será utilizada para acessar suas conversas ocultas:',
                ),
                SizedBox(height: 20),
                TextField(
                  controller: myController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '123456',
                    labelText: 'Sua senha: ',
                  ),
                ),
                Visibility(
                  visible: mostrarAviso,
                  child: Text(
                    'Defina sua senha primeiro!',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(height: 20),
                Text('Para acessar suas conversas digite:'),
                Text(
                  '"sua senha" + "√"',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        print("Before onPressed - mostrarAviso: $mostrarAviso");
                        print("Before onPressed - senhaCalc: $senhaCalc");

                        if (myController.text.isNotEmpty) {
                          setState(() {
                            senhaCalc = myController.text;
                            mostrarAviso = false;
                          });
                          await _saveSenhaCalcInLocalStorage(senhaCalc);
                          Navigator.of(context).pop();
                        } else {
                          setState(() {
                            mostrarAviso = true;
                          });
                        }

                        print("After onPressed - mostrarAviso: $mostrarAviso");
                        print("After onPressed - senhaCalc: $senhaCalc");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 40),
                          Text(
                            'Finalizar',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                          SizedBox(width: 40), // Texto
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    
    super.initState();
    controller.addListener(_listener);
    mostrarAviso = false;

    // Chama _checkAndNavigate no initState para verificar se a senha já foi definida
    _checkAndNavigate(context);
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    myController.dispose();

    super.dispose();
  }

  Future<void> _listener() async {
    // Atualiza o display ao ouvir alterações no controlador
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DisplayUp(valueUp: controller.displayUp),
                ],
              ),
              Display(value: controller.display),
            ],
          ),
          Expanded(
            flex: 3,
            child: ButtonHub(
              onButtonClick: (value) {
                controller.onButtonClick(value);
                _checkAndNavigate(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
