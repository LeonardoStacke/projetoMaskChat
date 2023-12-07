import 'dart:async';

import 'dart:typed_data';
import 'package:calculadora/src/widgets/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calculadora/models/user.dart';
import 'firebase_storage_service.dart';

class FirebaseFirestoreService {
  static final firestore = FirebaseFirestore.instance;

  static Future<void> createUser({
    required String name,
    required String image,
    required String email,
    required String uid,
    required String codigo,
  }) async {
    final user = UserModel(
      uid: uid,
      email: email,
      name: name,
      image: image,
      isOnline: true,
      lastActivate: DateTime.now(),
      codigo: codigo,
    );

    await firestore
        .collection('users')
        .doc(uid)
        .set(user.toJson());
  }

  static Future<void> addTextMessage({
    required String content,
    required String receiverId,
  }) async {
    final message = Message(
      senderId: FirebaseAuth.instance.currentUser!.uid,
      receiverId: receiverId,
      content: content,
      sentTime: DateTime.now(),
      messageType: MessageType.text,
    );
    await _addMessageToChat(receiverId, message);

  }

  static Future<void> addImageMessage({
  required String receiverId,
  required Uint8List file,
}) async {
  try {
    final image = await FirebaseStorageService.uploadImage(file, 'image/chat/${DateTime.now()}');
    print('Image uploaded successfully: $image');

    final message = Message(
      senderId: FirebaseAuth.instance.currentUser!.uid,
      receiverId: receiverId,
      content: image,
      sentTime: DateTime.now(),
      messageType: MessageType.image,
    );

    await _addMessageToChat(receiverId, message);
  } catch (error) {
    print('Error uploading image or adding message: $error');
    // Handle the error appropriately.
  }
}

  static Future<void> _addMessageToChat(
    String receiverId,
    Message message,
  ) async {
    await firestore
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chat')
        .doc(receiverId)
        .collection('messages')
        .add(message.toJson());

    await firestore
        .collection('user')
        .doc(receiverId)
        .collection('chat')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('messages')
        .add(message.toJson());
  }

}

