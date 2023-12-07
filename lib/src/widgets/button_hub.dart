import 'package:calculadora/src/calc_page.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/src/widgets/display.dart';
import 'package:calculadora/src/controllers/calc_controller.dart';
import '../conversas.dart';


sealed class ButtonClick{
  final String value;

  ButtonClick(this.value);
}

class CommonButtonClick extends ButtonClick{
  CommonButtonClick(super.value);
}

class EqualsButtonClick extends ButtonClick{
  EqualsButtonClick(super.value);
}

class ClearButtonClick extends ButtonClick{
  ClearButtonClick(super.value);
}

class ClearEntryButtonClick extends ButtonClick{
  ClearEntryButtonClick(super.value);
}

class ButtonHub extends StatelessWidget {
  final valorNaTela = CalcController().display;
  final controller = CalcController();
  final void Function(ButtonClick click)? onButtonClick;

  ButtonHub({super.key, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,

      crossAxisCount: 4,
      children: <Widget>[
        Button(
            value: '%',
            color: Colors.grey.withBlue(180).withAlpha(70),
            onTap: (value) {
              if (onButtonClick != null) {
                onButtonClick!(CommonButtonClick(value));
              } else {
                print('onButtonClick é nulo');
              }
            }
        ),
        Button(
            value: 'C',
            color: Theme.of(context).colorScheme.onError,
            onTap: (value) {
              if (onButtonClick != null) {
                onButtonClick!(ClearEntryButtonClick(value));
              } else {
                print('onButtonClick é nulo');
              }
            }
        ),
        Button(
          value: '⌫',
          color: Theme.of(context).colorScheme.errorContainer,
          onTap: (value){
            if (onButtonClick != null) {
              onButtonClick!(ClearButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(value: '÷', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(
            value: '7',color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
            onTap: (value) {
              if (onButtonClick != null) {
                   onButtonClick!(CommonButtonClick(value));
              } else {
                  print('onButtonClick é nulo');
              }
          },
        ),
        Button(
          value: '8',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(
          value: '9',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(value: 'x', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(
          value: '4',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(
          value: '5',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(
          value: '6',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(value: '-', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(
          value: '1',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(
          value: '2',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(
          value: '3',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(value: '+', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(value: '√', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));

            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(
          value: '0',
          color: Colors.grey.withBlue(250).withAlpha(50).withOpacity(0.1),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },
        ),
        Button(value: '.', color: Colors.grey.withBlue(180).withAlpha(70),
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(CommonButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
        Button(value: '=', color: Colors.blue,
          onTap: (value) {
            if (onButtonClick != null) {
              onButtonClick!(EqualsButtonClick(value));
            } else {
              print('onButtonClick é nulo');
            }
          },),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String value;

  final Color? color;
  final void Function(String value)? onTap;
  const Button({super.key, required this.value, this.color, this.onTap,});

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;
    return Material(
      child: InkWell(
        onTap: onTap == null ? null: () => onTap!(value),
         child: Container(
              padding: const EdgeInsets.all(8),
             child: Center(
               child: Text(
                 value,
                 style: Theme.of(context).textTheme.displaySmall,
               ),),

             decoration: BoxDecoration(
               color: color,
               borderRadius: BorderRadius.vertical(
                 top: Radius.circular(20),
                 bottom: Radius.circular(20)
               ),

           ),
            height: 50,


           ),
          ),
          
    );
  }
}

