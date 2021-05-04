import 'package:flutter/material.dart';
import 'size_config.dart';

const Color kMainColor = Color(0xff271160);
const Color kWhiteColor = Color(0xffffffff);
const Color kButtonColor = Color(0xffFFC175);
const Color kButtonTextColor = Color(0xff3E0606);

double _tm = SizeConfig.textMultiplier;
double _im = SizeConfig.imageSizeMultiplier;
final kTextFieldDecoration = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kWhiteColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kWhiteColor),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: kWhiteColor),
  ),
);
final kTextFieldDecoration2 = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);
final kTextFieldStyle = TextStyle(
  color: kWhiteColor,
  fontSize: _tm * 2.2,
  fontFamily: 'BasisGrotesquePro',
);
final kTextFieldStyle2 = TextStyle(
  color: Colors.black,
  fontSize: _tm * 2.2,
  fontFamily: 'BasisGrotesquePro',
);

final kTextStyle = TextStyle(
  color: kWhiteColor,
  fontFamily: 'BasisGrotesquePro',
  fontSize: _tm * 2.2,
);
final kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'BasisGrotesquePro',
  fontSize: _tm * 2.8,
  fontWeight: FontWeight.bold,
);
final kButtonTextStyle = TextStyle(
  color: kButtonTextColor,
  fontFamily: 'BasisGrotesquePro',
  fontSize: _tm * 2.2,
  fontWeight: FontWeight.bold,
);

final welcomeTextStyle = TextStyle(
    fontFamily: 'BasisGrotesquePro',
    fontSize: _tm * 5.2,
    fontWeight: FontWeight.bold,
    color: kWhiteColor);

var loading = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    CircularProgressIndicator(
      strokeWidth: 2.5,
      backgroundColor: Colors.white,
    ),
    SizedBox(
      width: _im * 3.20,
    ),
    Text(
      " Loading ... Please wait",
      style: kTextStyle.copyWith(color: kButtonColor),
    )
  ],
);
