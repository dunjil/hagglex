class Kyc {
  final String country;
  final String firstName;
  final String lastName;
  final String zipCode;
  final String gender;
  final String state;
  final String city;
  final String address;
  final String phoneNumber;
  final String dateOfBirth;
  final String identificationType;
  final String documentVerificationNumber;
  final String identificationFrontImg;
  final String identificationBackImg;
  final String photoProof;
  final String kycStatusMessage;
  final String submittedOn;
  final String verifiedOn;
  Kyc(
      {this.country,
      this.firstName,
      this.lastName,
      this.zipCode,
      this.gender,
      this.state,
      this.city,
      this.address,
      this.phoneNumber,
      this.dateOfBirth,
      this.identificationType,
      this.documentVerificationNumber,
      this.identificationFrontImg,
      this.identificationBackImg,
      this.photoProof,
      this.kycStatusMessage,
      this.submittedOn,
      this.verifiedOn});

  factory Kyc.fromJson(Map<dynamic, dynamic> json) {
    return Kyc(
      country: json['country'],
      firstName: json['firstName'],
      zipCode: json['zipCode'],
      gender: json['gender'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      identificationType: json['identificationType'],
      documentVerificationNumber: json['documentVerificationNumber'],
      identificationFrontImg: json['identificationFrontImg'],
      identificationBackImg: json['identificationBackImg'],
      photoProof: json['photoProof'],
      kycStatusMessage: json['kycStatusMessage'],
      submittedOn: json['submittedOn'],
      verifiedOn: json['verifiedOn'],
    );
  }
}
