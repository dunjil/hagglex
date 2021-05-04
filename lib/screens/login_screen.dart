import '../utils/global_import.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _hidePassword;

  BuildContext scaffoldContext;
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
      body: Padding(
        padding:
            EdgeInsets.only(top: _hm * 15, left: _im * 6.5, right: _im * 6.5),
        child: ListView(
          children: [
            Text(
              "Welcome!",
              style: welcomeTextStyle,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: _hm * 5,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Email Address',
                        labelStyle: kTextFieldStyle),
                    cursorColor: kWhiteColor,
                    style: kTextFieldStyle.copyWith(fontSize: 2.5 * _tm),
                    validator: (val) {
                      if (val.isEmpty) {
                        return "* Field must not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _password,
                    obscureText: !_hidePassword,
                    style: kTextFieldStyle.copyWith(fontSize: 2.5 * _tm),
                    decoration: kTextFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                          size: _im * 6.5,
                        ),
                        onPressed: hideUnhidePassword,
                      ),
                      labelText: "Password ( Min 8 Characters)",
                      labelStyle: kTextFieldStyle,
                    ),
                    cursorColor: kWhiteColor,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "* Field must not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: _hm * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: _hm * 5,
                  ),
                  provider.loggedInStatus == Status.Authenticating
                      ? loading
                      : Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () async {
                                  final form = _formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    await provider
                                        .login(_email.text, _password.text)
                                        .then((result) {
                                      if (result['status']) {
                                        final snackBar = SnackBar(
                                            content: Text("Login successful",
                                                style: kTextStyle.copyWith(
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                            backgroundColor: Colors.white);
                                        _scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardScreen(),
                                          ),
                                        );
                                      } else {
                                        final snackBar = SnackBar(
                                            content: Text("Login failed",
                                                style: kTextStyle.copyWith(
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                            backgroundColor: Colors.white);
                                        _scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      }
                                    });
                                  }
                                },
                                child: Text('LOG IN', style: kButtonTextStyle),
                                color: kButtonColor,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: _hm * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "New User? Create a new account",
                          style: kTextStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
