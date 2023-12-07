import 'package:calculadora/src/widgets/message.dart';
import 'package:calculadora/src/widgets/timestamp_converter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart'as timeago;



class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message, required this.isMe, required this.isImage});

  final Message message;
  final bool isMe;
  final bool isImage;
  

  @override
  Widget build(BuildContext context) => Align(
    alignment: 
      isMe ? Alignment.topLeft : Alignment.topRight,

  child: Container(
    decoration: BoxDecoration(
      color: isMe ?Theme.of(context).colorScheme.secondary  : Colors.blueGrey,

      borderRadius: isMe? BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30)
      ) : const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30)
      )
    ),
    margin: const EdgeInsets.only(
      top: 10, right: 10, left: 10
    ),
    padding: const EdgeInsets.all(10),
    
    child: Column(
      
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe
      ? CrossAxisAlignment.start 
      :CrossAxisAlignment.end,
      children: [
        isImage ? Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image:
              NetworkImage(message.content),
            fit: BoxFit.cover
            ),
          ),
        )
        : Text(message.content,
        style: TextStyle(color: Colors.white),),
        Text(
          timeago.format(message.sentTime),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10
          ),
        )
      ],
    ),
  )
  );
  
}