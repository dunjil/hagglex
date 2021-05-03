import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';

import 'flag_widget.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class CountryListTileWidget extends StatelessWidget {
  final Country country;
  final bool isSelected;
  final String countryCode;
  final String currency;
  final ValueChanged<Country> onSelectedCountry;

  const CountryListTileWidget({
    Key key,
    @required this.country,
    @required this.isSelected,
    @required this.onSelectedCountry,
    @required this.countryCode,
    @required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    final style = isSelected
        ? kTextStyle.copyWith(fontWeight: FontWeight.bold)
        : kTextStyle;

    return InkWell(
      onTap: () => onSelectedCountry(country),
      child: Container(
        padding:
            EdgeInsets.only(left: _im * 4, top: _hm * 1.5, bottom: _hm * 1.5),
        child: Row(
          children: [
            Expanded(
              child: FlagWidget(flag: country.flag),
            ),
            SizedBox(width: _im * 4),
            Expanded(
              flex: 8,
              child: Text(
                '(+${country.callingCode}) ${country.name}',
                style: style,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
