import 'package:meta/meta.dart';

class Country {
  final String name;
  final String callingCode;
  final String flag;
  final String currencySymbol;

  Country(
      {@required this.name,
      @required this.callingCode,
      @required this.currencySymbol,
      @required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        callingCode: json['callingCode'],
        currencySymbol: json['currencySymbol'],
        flag: json['flag'],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          currencySymbol == other.currencySymbol &&
          callingCode == other.callingCode &&
          flag == other.flag;

  @override
  int get hashCode =>
      name.hashCode ^
      currencySymbol.hashCode ^
      callingCode.hashCode ^
      flag.hashCode;
}
