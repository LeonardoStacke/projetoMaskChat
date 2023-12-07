import 'package:calculadora/models/user.dart';
import 'package:calculadora/provider/firebase_provider.dart';
import 'package:calculadora/src/widgets/chat_messages.dart';
import 'package:calculadora/src/widgets/chat_text_field.dart';
import 'package:calculadora/src/widgets/message.dart';
import 'package:calculadora/src/widgets/message_bubble.dart';
import 'package:calculadora/src/widgets/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BatePapoPage extends StatefulWidget {
  BatePapoPage({Key? key, required this.userId, required this.documentSnapshot}) : super(key: key);

  final String userId;
  final DocumentSnapshot documentSnapshot;

  @override
  State<BatePapoPage> createState() => _BatePapoPageState();
}

class _BatePapoPageState extends State<BatePapoPage> {
  final messages = [
    Message(
      senderId: '2',
      receiverId: '1NWapWIP2UVcv2Je0Xvi',
      content: 'See you later',
      sentTime: DateTime.now(),
      messageType: MessageType.text,
    ),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '2',
        content: 'What are you doing?',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
  ];

  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.documentSnapshot['image']),
              radius: 22,
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text(widget.documentSnapshot['name'], style: TextStyle(fontSize: 18),),
                Text(
                  widget.documentSnapshot['isOnline']
                      ? 'Online'
                      : 'Online ' + timeConverter(widget.documentSnapshot['lastActivate']),
                  style: TextStyle(
                    color: widget.documentSnapshot['isOnline'] ? Colors.green : Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ChatMessages(receiverId: widget.userId,),
            ChatTextField(documentSnapshot: widget.documentSnapshot,),
          ],
        ),
      ),
    );
  }
}
