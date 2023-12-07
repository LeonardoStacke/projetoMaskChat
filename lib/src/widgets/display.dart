import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String value;
  const Display({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
class DisplayUp extends StatelessWidget {
  final String valueUp;
  const DisplayUp({super.key, required this.valueUp});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          valueUp,
          style: TextStyle(color: Colors.blueGrey, fontSize: 40),
        ),
      ),
    );
  }
}

class ValorDoBotao extends StatelessWidget {
  final String ValorBotao;
  const ValorDoBotao({super.key, required this.ValorBotao});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          ValorBotao,
          style: TextStyle(color: Colors.blueGrey, fontSize: 40),
        ),
      ),
    );
  }
}
