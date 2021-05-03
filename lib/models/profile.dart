class Profile {
  final String displayName;
  final String currency;
  final String profilePicture;
  final String dateOfBirth;
  final String country;
  final bool twoFactorEnabled;
  final bool orderNotification;
  final bool chatNotification;
  final bool marketNotification;
  final bool pushNotification;
  final bool otcNotification;
  final bool withdrawalsNotification;
  final bool utilitiesNotification;
  final String kycStatusMessage;
  Profile(
      {this.displayName,
      this.currency,
      this.profilePicture,
      this.dateOfBirth,
      this.country,
      this.twoFactorEnabled,
      this.orderNotification,
      this.chatNotification,
      this.marketNotification,
      this.pushNotification,
      this.otcNotification,
      this.withdrawalsNotification,
      this.utilitiesNotification,
      this.kycStatusMessage});

  factory Profile.fromJson(Map<dynamic, dynamic> json) {
    return Profile(
        displayName: json['displayName'],
        currency: json['currency'],
        profilePicture: json['profilePicture'],
        dateOfBirth: json['dateOfBirth'],
        country: json['country'],
        twoFactorEnabled: json['twoFactorEnabled'],
        orderNotification: json['orderNotification'],
        chatNotification: json['chatNotification'],
        marketNotification: json['marketNotification'],
        pushNotification: json['pushNotification'],
        otcNotification: json['otcNotification'],
        withdrawalsNotification: json['withdrawalsNotification'],
        utilitiesNotification: json['utilitiesNotification'],
        kycStatusMessage: json['kycStatusMessage']);
  }
}
