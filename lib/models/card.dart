import 'package:hagglex/models/card_details.dart';

class Card {
  final String id;
  final String user;
  final CardDetails cardDetails;
  Card({this.id, this.user, this.cardDetails});

  factory Card.fromJson(Map<dynamic, dynamic> json) {
    return Card(
        id: json['id'],
        user: json['user'],
        cardDetails: CardDetails.fromJson(json['cardDetails']));
  }
}
