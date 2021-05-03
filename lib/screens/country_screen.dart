import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/providers/country_provider.dart';
import 'package:hagglex/utils/global_import.dart';
import 'package:hagglex/utils/util.dart';
import 'package:hagglex/widgets/country_listtile_widget.dart';
import 'package:hagglex/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class CountryPage extends StatefulWidget {
  final bool isMultiSelection;
  final List<Country> countries;

  const CountryPage({
    Key key,
    this.isMultiSelection = false,
    this.countries = const [],
  }) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String text = '';
  List<Country> selectedCountries = [];

  @override
  void initState() {
    super.initState();

    selectedCountries = widget.countries;
  }

  bool containsSearchText(Country country) {
    final name = country.name;
    final textLower = text.toLowerCase();
    final countryLower = name.toLowerCase();

    return countryLower.contains(textLower);
  }

  List<Country> getPrioritizedCountries(List<Country> countries) {
    final notSelectedCountries = List.of(countries)
      ..removeWhere((country) => selectedCountries.contains(country));

    return [
      ...List.of(selectedCountries)..sort(Utils.ascendingSort),
      ...notSelectedCountries,
    ];
  }

  @override
  Widget build(BuildContext context) {
    double _im = SizeConfig.imageSizeMultiplier;
    final provider = Provider.of<CountryProvider>(context);
    final allCountries = getPrioritizedCountries(provider.countries);
    final countries = allCountries.where(containsSearchText).toList();

    return Scaffold(
      backgroundColor: kMainColor,
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _im * 5, vertical: 0),
            child: Divider(
              color: kWhiteColor,
            ),
          ),
          allCountries.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Loading available countries...",
                      style: kTextStyle,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView(
                    children: countries.map((country) {
                      final isSelected = selectedCountries.contains(country);
                      return CountryListTileWidget(
                        country: country,
                        isSelected: isSelected,
                        onSelectedCountry: selectCountry,
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    final label = 'Country';

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kMainColor,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchWidget(
          text: text,
          onChanged: (text) => setState(() => this.text = text),
          hintText: 'Search $label',
        ),
      ),
    );
  }

  void selectCountry(Country country) {
    Navigator.pop(context, country);
  }

  void submit() => Navigator.pop(context, selectedCountries);
}
