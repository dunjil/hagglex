import '../utils/global_import.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/mutations_and_queries.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _referralCode = TextEditingController();
  Country country = Country(
    name: 'Nigeria',
    callingCode: '234',
    currencySymbol: 'NGN',
    flag: 'https://restcountries.eu/data/nga.svg',
  );

  bool _hidePassword;
  Api api = Api();
  hideUnhidePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _hidePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kMainColor,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: _hm * 5, left: _im * 5, right: _im * 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/images/backbtn.png'),
                        radius: _im * 6,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: _hm * 3),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: _hm * 3.0, horizontal: _im * 5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Create a new account",
                              style: kTitleTextStyle,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextFieldDecoration2.copyWith(
                            labelText: 'Email Address',
                            labelStyle: kTextFieldStyle2),
                        cursorColor: Colors.black,
                        style: kTextFieldStyle2.copyWith(fontSize: 2.5 * _tm),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "* Field must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _hm * 1.5),
                      TextFormField(
                        cursorColor: Colors.black,
                        obscureText: !_hidePassword,
                        controller: _password,
                        decoration: kTextFieldDecoration2.copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kMainColor,
                              size: _im * 6.5,
                            ),
                            onPressed: hideUnhidePassword,
                          ),
                          labelText: "Password ( Min 8 Characters)",
                          labelStyle: kTextFieldStyle2,
                        ),
                        style: kTextFieldStyle2.copyWith(fontSize: 2.5 * _tm),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "* Field must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _hm * 1.5),
                      TextFormField(
                        controller: _username,
                        decoration: kTextFieldDecoration2.copyWith(
                            labelText: 'Create a username',
                            labelStyle: kTextFieldStyle2),
                        cursorColor: Colors.black,
                        style: kTextFieldStyle2.copyWith(fontSize: 2.5 * _tm),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "* Field must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _hm * 1.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 1, child: buildSingleCountry()),
                          SizedBox(width: _im * 1.5),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: _hm * 0.5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _phone,
                                decoration: kTextFieldDecoration2.copyWith(
                                  labelText: 'Enter your phone number',
                                  labelStyle: kTextFieldStyle2,
                                ),
                                cursorColor: Colors.black,
                                style: kTextFieldStyle2.copyWith(
                                    fontSize: 2.5 * _tm),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "* Field must not be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _hm * 0.3),
                      TextFormField(
                        controller: _referralCode,
                        decoration: kTextFieldDecoration2.copyWith(
                            labelText: 'Referral Code (Optional)',
                            labelStyle:
                                kTextFieldStyle2.copyWith(color: Colors.grey)),
                        cursorColor: Colors.black,
                        style: kTextFieldStyle2.copyWith(fontSize: 2.5 * _tm),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "* Field must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _hm * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "By signing, you agree to HaggleX terms and privacy policy.",
                              style: kTextStyle.copyWith(
                                  color: Colors.black, fontSize: _tm * 2.0),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: _hm * 3),
                      provider.registeredInStatus == Status.Registering
                          ? loading
                          : GradientButton(
                              height: _hm * 7,
                              child: Text(
                                'SIGN UP',
                                style: kButtonTextStyle.copyWith(
                                    color: kWhiteColor),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  kMainColor,
                                  kMainColor.withOpacity(0.85)
                                ],
                              ),
                              onPressed: () async {
                                final form = _formKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  await provider
                                      .register(
                                          _email.text,
                                          _password.text,
                                          _username.text,
                                          _referralCode.text,
                                          _phone.text,
                                          country)
                                      .then((result) {
                                    if (result['status']) {
                                      createSnackBar("Registration successful");
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerifyEmailScreen(),
                                        ),
                                      );
                                    } else {
                                      createSnackBar("Registration failed");
                                    }
                                  });
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: _hm * 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({
    @required String title,
    @required VoidCallback onTap,
    Widget leading,
  }) {
    double _tm = SizeConfig.textMultiplier;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(child: leading),
          SizedBox(width: _tm * 1.5),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style:
                  kTextStyle.copyWith(color: Colors.black, fontSize: _tm * 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCountryPicker({
    @required Widget child,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: child,
      );

  Widget buildSingleCountry() {
    final onTap = () async {
      final country = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CountryPage()),
      );

      if (country == null) return;

      setState(() => this.country = country);
    };

    return buildCountryPicker(
      child: buildListTile(
        title: '(+${country.callingCode})',
        leading: FlagWidget(flag: country.flag),
        onTap: onTap,
      ),
    );
  }

  void createSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(message, style: kTextStyle.copyWith(color: Colors.black)),
        backgroundColor: Colors.white);

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
