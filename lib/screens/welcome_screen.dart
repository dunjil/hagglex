import '../utils/global_import.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

String email;
bool loggedIn = false;
bool verified = false;

class _WelcomeScreenState extends State<WelcomeScreen> {
  loadBusinessIdPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _loggedIn = prefs.getBool("loggedIn");
    bool _verified = prefs.getBool("verified");
    String _email = prefs.getString("email");
    loggedIn = _loggedIn;
    verified = _verified;
    email = _email;
    if (_loggedIn != null) {
      loggedIn = _loggedIn;
    }
    if (_verified != null) {
      verified = _verified;
    }
  }

  Timer time;
  @override
  void dispose() {
    super.dispose();
    time.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    time = Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              !loggedIn && !verified && email == null
                  ? LoginScreen()
                  : !verified && email != null
                      ? VerifyEmailScreen()
                      : DashboardScreen(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 220),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: _hm * 8.5,
              ),
            ),
          ),
          SizedBox(
            height: _hm * 3.7,
          ),
          Text(
            "HaggleX",
            style: TextStyle(
                fontFamily: 'BasisGrotesquePro',
                fontSize: _tm * 4.3,
                fontWeight: FontWeight.bold,
                color: kWhiteColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
