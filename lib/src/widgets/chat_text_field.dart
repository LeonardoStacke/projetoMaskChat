import 'dart:typed_data';

import 'package:calculadora/services/auth/firebase_firestore_service.dart';
import 'package:calculadora/services/auth/media_service.dart';
import 'package:calculadora/src/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.documentSnapshot});

  final DocumentSnapshot documentSnapshot;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

  final controller = TextEditingController();

  Uint8List? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: 
      CustomTextFormField(
        controller: controller,
        hintText: 'Adicionar Mensagem...',
      ),
      
      ),
      const SizedBox(width: 5,),
      CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        radius: 24,
        child: IconButton(icon: const Icon(Icons.send,
        color: Colors.white,),
        onPressed: () =>_sendText(context),
        ),
      ),
      SizedBox(width: 5,),
      CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        radius: 24,
        child: IconButton(icon: const Icon(Icons.camera_alt,
        color: Colors.white,),
        onPressed: (){
          _sendImage();
        },
        ),
      ),
      
    ],
  );
  Future<void>_sendText(BuildContext context) async{
    if (controller.text.isNotEmpty){
      await FirebaseFirestoreService.addTextMessage(
        content: controller.text, 
        receiverId: widget.documentSnapshot['uid']);
        controller.clear();
        FocusScope.of(context).unfocus();
    }
  }

  Future<void>_sendImage() async{

    final pickedImage = await MediaService.pickImage();
    setState(() => file = pickedImage
    );
    if (file != null){
      await FirebaseFirestoreService.addImageMessage(receiverId: widget.documentSnapshot['uid'], file: file!,);
    }
    
  }
}

