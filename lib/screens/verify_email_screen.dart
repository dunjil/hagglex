import '../utils/global_import.dart';
import '../models/user_model.dart';
import 'success_screen.dart';
import '../services/api.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController _code = TextEditingController();
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
    AuthProvider auth = Provider.of<AuthProvider>(context);
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: _hm * 6, left: _im * 5, right: _im * 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => RegistrationScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/backbtn.png',
                        ),
                        radius: _im * 6,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: _hm * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Verify your account",
                      style: kTitleTextStyle.copyWith(
                        fontSize: _tm * 3.5,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _hm * 3),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: _hm * 3.0, horizontal: _im * 5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/images/checkbtn.png'),
                          radius: _im * 8,
                        )
                      ],
                    ),
                    SizedBox(height: _hm * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "We just sent a verification code to your email. Please enter the code",
                            style: kTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: _tm * 2.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: _hm * 6),
                    TextFormField(
                      controller: _code,
                      decoration: kTextFieldDecoration2.copyWith(
                        labelText: 'Verification code',
                        labelStyle: kTextFieldStyle2,
                      ),
                      cursorColor: Colors.black,
                      style: kTextFieldStyle2.copyWith(fontSize: 2.5 * _tm),
                    ),
                    SizedBox(height: _hm * 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "This code will expire in 10 minutes.",
                            style: kTextStyle.copyWith(
                                color: Colors.black, fontSize: _tm * 2.0),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: _hm * 3),
                    auth.verifiedInStatus == Status.Verifying
                        ? loading
                        : GradientButton(
                            height: _hm * 7,
                            child: Text(
                              'VERIFY ME',
                              style:
                                  kButtonTextStyle.copyWith(color: kWhiteColor),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[
                                kMainColor,
                                kMainColor.withOpacity(0.85)
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SuccessScreen(),
                                ),
                              );
                            },
                          ),
                    SizedBox(height: _hm * 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "RESEND CODE",
                            style: kTextStyle.copyWith(
                                color: Colors.black,
                                fontSize: _tm * 2.3,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _hm * 6),
                  ],
                ),
              ),
              SizedBox(height: _hm * 3),
            ],
          ),
        ),
      ),
    );
  }
}
