
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      
      height: 250,
      padding: EdgeInsets.only(top: 20),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(bottom:10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/app/imagemPerfil1.jpg')
              )
            ),
          ),
        Text('Julia Stacke', style: Theme.of(context).textTheme.bodyLarge),
        Text('jujugatinhaamarela@hotmail.com', style: Theme.of(context).textTheme.bodySmall,),

        SizedBox(height: 30),

        Expanded(

          child: 
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 10,
          color: Theme.of(context).colorScheme.onTertiary,
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seu código: ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground)
                  ),
                  SizedBox(width: 10,),
                  Text(
                '56891732',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold, fontSize: 17)
                  ),
                SizedBox(width: 5,),
                Icon(Icons.copy, size: 18,color: Colors.grey,)
            ],
          )
              ),
        ),
        SizedBox(height: 20,)
        
        ]),
    );
  }
}