class PhoneNumberDetails {
  final String phoneNumber;
  final String callingCode;
  final String flag;
  PhoneNumberDetails({this.phoneNumber, this.callingCode, this.flag});

  factory PhoneNumberDetails.fromJson(Map<dynamic, dynamic> json) {
    return PhoneNumberDetails(
        phoneNumber: json['phoneNumber'],
        callingCode: json['callingCode'],
        flag: json['flag']);
  }
}
