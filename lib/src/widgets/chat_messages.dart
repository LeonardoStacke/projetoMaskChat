import 'package:calculadora/src/widgets/message.dart';
import 'package:calculadora/src/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/firebase_provider.dart';


class ChatMessages extends StatelessWidget {
  ChatMessages({super.key, required this.receiverId});

  final String receiverId;

  final messages = [
    Message(
        senderId: '1',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content: 'Oi, bom dia',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '1',
        content: 'Tudo bem?',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content: 'Tô bem',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '1',
        content: 'Fazendo oq?',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content: 'Nada',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '2',
        content: 'Pode me ajudar com um negócio?',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content:
            'https://images.unsplash.com/photo-1669992755631-3c46eccbeb7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
        sentTime: DateTime.now(),
        messageType: MessageType.image),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '2',
        content: 'Obrigado',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
      senderId: '2',
      receiverId: '1NWapWIP2UVcv2Je0Xvi',
      content: 'De nada',
      sentTime: DateTime.now(),
      messageType: MessageType.text,
    ),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '2',
        content: 'Tchau',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content: 'Tchau!',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '1NWapWIP2UVcv2Je0Xvi',
        receiverId: '2',
        content: 'Até mais',
        sentTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: '1NWapWIP2UVcv2Je0Xvi',
        content: 'Até',
        sentTime: DateTime.now(),
        messageType: MessageType.text)
  ];

  @override
  Widget build(BuildContext context) => Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final isTextMessage = 
                    messages[index].messageType == MessageType.text;

                  final isMe = receiverId == messages[index].senderId;
                  return isTextMessage
                  ? MessageBubble(
                    isMe: isMe,
                    message: messages[index],
                    isImage: false
                  )
                  : MessageBubble(message: messages[index], isMe: isMe, isImage: true);
                },
              ),
            );
}
      