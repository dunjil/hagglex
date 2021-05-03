import '../utils/global_import.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;

    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _hm * 22),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/success.png',
                    height: _hm * 8.2,
                  ),
                ),
                SizedBox(
                  height: _hm * 3.7,
                ),
                Text(
                  "Setup Complete",
                  style: TextStyle(
                      fontFamily: 'BasisGrotesquePro',
                      fontSize: _tm * 2.5,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _hm * 3.4,
                ),
                Text(
                  "Thank you for setting up your HaggleX account",
                  style: TextStyle(
                    fontFamily: 'BasisGrotesquePro',
                    fontSize: _tm * 2.2,
                    color: kWhiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _hm * 25,
                ),
                Container(
                  width: _im * 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.transparent)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                    child: Text('START EXPLORING', style: kButtonTextStyle),
                    color: kButtonColor,
                  ),
                ),
                SizedBox(
                  height: _hm * 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
