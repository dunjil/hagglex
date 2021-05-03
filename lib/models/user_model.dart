import 'package:hagglex/models/phonenumber_details.dart';

import 'card.dart';
import 'kyc.dart';
import 'payment_method.dart';
import 'profile.dart';
import 'role.dart';

class User {
  final String id;
  final String username;
  final String phoneNumber;
  final PhoneNumberDetails phoneNumberDetails;
  final String email;
  final String referralCode;
  final double totalReferralEarning;
  final int referralCount;
  final int tradeCount;
  final double avgTradeRating;
  final String kycStatus;
  final bool emailVerified;
  final bool phoneNumberVerified;
  final bool active;
  final bool suspended;
  final Role role;
  final Profile profile;
  final Card userCard;
  final Kyc kyc;
  final List<PaymentMethod> paymentMethods;
  final String createdAt;

  User(
      {this.id,
      this.username,
      this.phoneNumber,
      this.phoneNumberDetails,
      this.email,
      this.referralCode,
      this.totalReferralEarning,
      this.referralCount,
      this.tradeCount,
      this.avgTradeRating,
      this.kycStatus,
      this.emailVerified,
      this.phoneNumberVerified,
      this.active,
      this.suspended,
      this.role,
      this.profile,
      this.userCard,
      this.kyc,
      this.paymentMethods,
      this.createdAt});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        phoneNumber: json['phoneNumber'],
        phoneNumberDetails: json['phoneNumberDetails'],
        email: json['email'],
        referralCode: json['referralCode'],
        totalReferralEarning: json['totalReferralEarning'],
        referralCount: json['referralCount'],
        tradeCount: json['tradeCount'],
        avgTradeRating: json['avgTradeRating'],
        kycStatus: json['kycStatus'],
        emailVerified: json['emailVerified'],
        phoneNumberVerified: json['phoneNumberVerified'],
        active: json['active'],
        suspended: json['suspended'],
        role: json['role'],
        profile: json['profile'],
        userCard: json['userCard'],
        kyc: json['kyc'],
        paymentMethods: json['paymentMethods'],
        createdAt: json['createdAt']);
  }
}
