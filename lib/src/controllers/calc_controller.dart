
import 'dart:math';

import 'package:calculadora/src/conversas.dart';
import 'package:calculadora/src/widgets/button_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcController extends ChangeNotifier {
  var display = '0';
  var displayUp = '';
  var clickValue = '';
  double numeros1 = 0;
  double numeros2 = 0;
  double resultado = 0;
  bool ultimoNumero = false;
  String numerosString1 ='';
  String numerosString2 ='';
  bool ClearDoubleClick = false;

  void onButtonClick(ButtonClick click) {
    clickValue = click.value;
    if (display == '0') {
      display = '';
    }
    if (click is CommonButtonClick) {
      ClearDoubleClick = false;

      if ((click.value == 'x' || click.value == '-' || click.value == '+' || click.value == '-' || click.value == '÷')) {

        if (display == '') {
          display = '0';
        }
        if(displayUp != '' && ultimoNumero == false && click.value != '%' ){
              displayUp = displayUp.substring(0, displayUp.length - 1);
              displayUp += click.value;

        } else if(displayUp == '' && click.value == '-' && display == '0'){
          display = click.value;



        } else if(displayUp == ''){
          display += click.value;
          displayUp = display;
          display = '0';

        }
        else {
          if (displayUp.substring(displayUp.length - 1) == 'x'){
            numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
            numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
            if (display.substring(0,1) == '√'){
              numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
              numeros2 = double.parse(numerosString2);
              numeros2 = sqrt(numeros2);
            }else{
              numeros2 = double.parse(numerosString2);
            }
            if (displayUp.substring(0,1) == '-'){
              numerosString1 = '-' + numerosString1;
            }
            numeros1 = double.parse(numerosString1);

            display = '0';
            resultado = numeros1 * numeros2;
            displayUp = resultado.toString();
            displayUp += click.value;

          } else if (displayUp.substring(displayUp.length - 1) == '+') {

            numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
            numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
            if (display.substring(0,1) == '√'){
              numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
              numeros2 = double.parse(numerosString2);
              numeros2 = sqrt(numeros2);
            }else{
              numeros2 = double.parse(numerosString2);
            }
            if (displayUp.substring(0,1) == '-'){
              numerosString1 = '-' + numerosString1;
            }
            numeros1 = double.parse(numerosString1);

            display = '0';
            resultado = numeros1 + numeros2;
            displayUp = resultado.toString();
            displayUp += click.value;

          } else if (displayUp.substring(displayUp.length - 1) == '-') {
            numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
            numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
            if (display.substring(0,1) == '√'){
              numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
              numeros2 = double.parse(numerosString2);
              numeros2 = sqrt(numeros2);
            }else{
              numeros2 = double.parse(numerosString2);
            }
            if (displayUp.substring(0,1) == '-'){
              numerosString1 = '-' + numerosString1;
            }
            numeros1 = double.parse(numerosString1);

            display = '0';
            resultado = numeros1 - numeros2;
            displayUp = resultado.toString();
            displayUp += click.value;

          } else if (displayUp.substring(displayUp.length - 1) == '÷') {
            numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
            numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
            if (display.substring(0,1) == '√'){
              numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
              numeros2 = double.parse(numerosString2);
              numeros2 = sqrt(numeros2);
            }else{
              numeros2 = double.parse(numerosString2);
            }
            if (displayUp.substring(0,1) == '-'){
              numerosString1 = '-' + numerosString1;
            }
            numeros1 = double.parse(numerosString1);

            display = '0';
            resultado = numeros1 / numeros2;
            displayUp = resultado.toString();
            displayUp += click.value;

          } else if (displayUp.substring(displayUp.length - 1) == ' ') {
            display += click.value;
            displayUp = display;
            display = '0';

          }else{
            display = 'ERRO';
          }
        }
        ultimoNumero = false;
      } else if(click.value == '%'){
        if(displayUp != '' && ultimoNumero == true){
          numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
          numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
          if (displayUp.substring(0, 1) == '-') {
            numerosString1 = '-' + numerosString1;
          }
          numeros1 = double.parse(numerosString1);
          numeros2 = double.parse(numerosString2);
          if (displayUp.substring(displayUp.length - 1) == '÷') {

            resultado = numeros1 / (numeros2/100);
            displayUp = numerosString1+ " ÷ "+ numerosString2+'% = ';
            display = resultado.toString();
          } else if (displayUp.substring(displayUp.length - 1) == 'x') {

            resultado = numeros1 * (numeros2/100);
            displayUp = numerosString1+ " x "+ numerosString2+'% = ';
            display = resultado.toString();
          } else if (displayUp.substring(displayUp.length - 1) == '-') {

          resultado = numeros1 - (numeros1* numeros2/100);
          displayUp = numerosString1+ " - "+ numerosString2+'% = ';
          display = resultado.toString();
        } else if (displayUp.substring(displayUp.length - 1) == '+') {

            resultado = numeros1 + (numeros1* numeros2/100);
            displayUp = numerosString1+ " - "+ numerosString2+'% = ';
            display = resultado.toString();
          }

        }else{
          displayUp = '';
          display = '0';
        }
      }else if(click.value == '√'){

        if(ultimoNumero == false ){
          display += click.value;
        }

      } else{
        if (click.value == '.' && display == '' ){
          display = '0.';
        }else{
          display += click.value;
        }

        ultimoNumero = true;

      }
    } else if (click is ClearButtonClick) {
      ClearDoubleClick = false;
      ultimoNumero = false;
      if(displayUp.length >=1 && displayUp.substring(displayUp.length - 1) == ' '){
        displayUp = '';
        display = '0';
      }
      else if (display.length <= 1) {
        display = '0';
      } else {
        display = display.substring(0, display.length - 1);

      }
    } else if (click is ClearEntryButtonClick) {
      display = '0';
      if(displayUp.length >=1 && displayUp.substring(displayUp.length - 1) == ' ') {
        displayUp = '';
        display = '0';
        ultimoNumero = false;
      }
      if (ClearDoubleClick == true) {
        displayUp = '';
      }
      ClearDoubleClick = true;

    } else if (click is EqualsButtonClick) {
      ClearDoubleClick = false;
      if(displayUp != '' && ultimoNumero == true){
        numerosString1 = displayUp.replaceAll(RegExp(r'[^0-9.]'), '');
        numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');

        if (display.substring(0,1) == '√'){
          numerosString2 = display.replaceAll(RegExp(r'[^0-9.]'), '');
          numeros2 = double.parse(numerosString2);
          numeros2 = sqrt(numeros2);
          numerosString2 = display;
        }else{
          numeros2 = double.parse(numerosString2);
        }
        if (displayUp.substring(0,1) == '-'){
          numerosString1 = '-' + numerosString1;
        }
        if (displayUp.substring(0, 1) == '-') {
          numerosString1 = '-' + numerosString1;
        }
        numeros1 = double.parse(numerosString1);

        if (displayUp.substring(displayUp.length - 1) == '÷') {

          resultado = numeros1 / numeros2;
          displayUp = numerosString1+ " ÷ "+ numerosString2+' = ';
          display = resultado.toString();
        } else if (displayUp.substring(displayUp.length - 1) == 'x') {

          resultado = numeros1 * numeros2;
          displayUp = numerosString1+ " x "+ numerosString2+' = ';
          display = resultado.toString();
        } else if (displayUp.substring(displayUp.length - 1) == '-') {

          resultado = numeros1 - numeros2;
          displayUp = numerosString1+ " - "+ numerosString2+' = ';
          display = resultado.toString();
        } else if (displayUp.substring(displayUp.length - 1) == '+') {

          resultado = numeros1 + numeros2;
          displayUp = numerosString1+ " + "+ numerosString2+' = ';
          display = resultado.toString();
        }

      }else if(displayUp==''&& display.contains('√') == true){
        numerosString1 = display.replaceAll(RegExp(r'[^0-9.]'), '');
        numeros1 = double.parse(numerosString1);
        resultado = sqrt(numeros1);
        displayUp = '$display = ';
        display = resultado.toString();
      }else{
        displayUp = '';
        display = '0';
      }

    }
    notifyListeners();
  }
}