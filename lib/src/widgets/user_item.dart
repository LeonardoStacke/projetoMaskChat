import 'package:calculadora/models/user.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


class UserItem extends StatefulWidget {
  const UserItem({super.key, required this.user});
  
  final UserModel user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) => 
  GestureDetector(
    onTap:(){
        
    },
    child:
    ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(alignment:Alignment.bottomRight,
      children: [CircleAvatar(
        radius: 30,
        backgroundImage: 
          NetworkImage(widget.user.image),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child:  
        CircleAvatar(
              backgroundColor: widget.user.isOnline 
              ? Colors.green 
              : Colors.grey,
              radius: 5,
      ),
      )
    
      ]
      ),
      title: Text(
        widget.user.name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Text(
        'Último acesso : ${timeago.format(widget.user.lastActivate, locale:'pt_br')}' 
      ),
    )
    );
    
  }