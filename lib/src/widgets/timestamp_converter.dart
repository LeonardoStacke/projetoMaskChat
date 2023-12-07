import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

String timeConverter(Timestamp timestamp) {
  final DateTime date = timestamp.toDate();
  final now = DateTime.now();

  final difference = now.difference(date);
  return timeago.format(now.subtract(difference), locale: 'pt_BR');
}
