class PaymentMethod {
  final String id;
  final String user;
  final String cardDetails;
  PaymentMethod({this.id, this.user, this.cardDetails});

  factory PaymentMethod.fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethod(
        id: json['id'], user: json['user'], cardDetails: json['cardDetails']);
  }
}
