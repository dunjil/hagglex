import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/size_config.dart';

class FlagWidget extends StatelessWidget {
  final String flag;

  const FlagWidget({
    Key key,
    @required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;

    return SvgPicture.network(
      flag,
      height: _hm * 3,
      width: _im * 6,
      fit: BoxFit.cover,
    );
  }
}
