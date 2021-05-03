class CardDetails {
  final String cardType;
  final String authorizationCode;
  final String bank;
  final String bin;
  final String brand;
  final String expMonth;
  final String expYear;
  final String last4;
  final String channel;
  final String countryCode;

  CardDetails({
    this.cardType,
    this.authorizationCode,
    this.bank,
    this.bin,
    this.brand,
    this.expMonth,
    this.expYear,
    this.last4,
    this.channel,
    this.countryCode,
  });

  factory CardDetails.fromJson(Map<dynamic, dynamic> json) {
    return CardDetails(
      cardType: json['cardType'],
      authorizationCode: json['authorizationCode'],
      bank: json['bank'],
      bin: json['bin'],
      brand: json['brand'],
      expMonth: json['expMonth'],
      expYear: json['expYear'],
      last4: json['last4'],
      channel: json['channel'],
      countryCode: json['countryCode'],
    );
  }
}
