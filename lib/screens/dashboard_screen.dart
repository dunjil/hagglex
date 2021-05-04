import '../utils/global_import.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool status5 = false;
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: kMainColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: _hm * 6,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(_im * 1),
                            decoration: BoxDecoration(
                              color: kMainColor,
                              border: Border.all(
                                color: kWhiteColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(_im * 5),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(_im * 1),
                              decoration: BoxDecoration(
                                  color: Color(0XFFE9BBFF),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(_im * 5),
                                  )),
                              child: Text(
                                "SV",
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2E1963)),
                              ),
                            ),
                          ),
                          Text(
                            "HaggleX",
                            style: TextStyle(
                                fontFamily: 'BasisGrotesquePro',
                                fontSize: _tm * 2.5,
                                fontWeight: FontWeight.bold,
                                color: kWhiteColor),
                            textAlign: TextAlign.center,
                          ),
                          Badge(
                            badgeContent: Text(
                              '3',
                              style: kTextStyle.copyWith(fontSize: _tm * 1.7),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(_im),
                              decoration: BoxDecoration(
                                color: Color(0XFF47327A),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_im * 5),
                                ),
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: kWhiteColor,
                                size: _im * 6,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _hm * 5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Portfolio Balance",
                                style: TextStyle(
                                    fontFamily: 'BasisGrotesquePro',
                                    fontSize: _tm * 1.8,
                                    color: kWhiteColor),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: _hm * 2,
                              ),
                              Text(
                                "\$\*\*\*\*",
                                style: TextStyle(
                                    fontFamily: 'BasisGrotesquePro',
                                    fontSize: _tm * 2.8,
                                    fontWeight: FontWeight.bold,
                                    color: kWhiteColor),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          FlutterSwitch(
                            inactiveColor: kWhiteColor,
                            activeColor: kWhiteColor,
                            width: _im * 32,
                            height: _hm * 5.5,
                            valueFontSize: _tm * 2,
                            toggleSize: _im * 15,
                            value: status5,
                            borderRadius: _im * 9,
                            activeTextColor: Colors.black,
                            inactiveTextColor: Colors.black,
                            inactiveText: 'NGN',
                            activeText: 'USD',
                            activeTextFontWeight: FontWeight.normal,
                            inactiveTextFontWeight: FontWeight.normal,
                            inactiveToggleColor:
                                Color(0XFFFFC175).withOpacity(0.8),
                            activeToggleColor:
                                Color(0XFFFFC175).withOpacity(0.8),
                            padding: _im * 1.2,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status5 = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _hm * 4,
                    ),
                  ],
                ),
              ),
              Container(
                color: kWhiteColor,
                padding: EdgeInsets.all(_im * 3),
                child: Column(
                  children: [
                    Container(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              AddBanner(
                                  assetloc: 'assets/images/dashboardadd.png'),
                              AddBanner(
                                  assetloc: 'assets/images/dashboardadd4.png'),
                              AddBanner(
                                  assetloc: 'assets/images/dashboardadd2.png'),
                              AddBanner(
                                  assetloc: 'assets/images/dashboardadd3.png'),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: _hm * 4,
                    ),
                    ListTile(
                      leading: Text(
                        "Markets",
                        style: kTitleTextStyle.copyWith(fontSize: _tm * 2.3),
                        textAlign: TextAlign.left,
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          await provider.clearPrefs();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: FaIcon(FontAwesomeIcons.signOutAlt,
                            size: _tm * 2.8, color: Colors.red),
                      ),
                    ),
                    MarketsCard(
                        currencyName: "Haggle (HAG)",
                        iconName: 'assets/images/haggle.png',
                        ngnPrice: "NGN 380",
                        percentIncrease: "",
                        graphName: 'assets/images/hagglegraph.png'),
                    MarketsCard(
                        currencyName: "Bitcoin (BTC)",
                        iconName: 'assets/images/dodgeicon.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/btcgraph.png'),
                    MarketsCard(
                        currencyName: "Ethereum (ETH)",
                        iconName: 'assets/images/litecoin.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/ethgraph.png'),
                    MarketsCard(
                        currencyName: "Tether (USDT)",
                        iconName: 'assets/images/usdt.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/usdtgraph.png'),
                    MarketsCard(
                        currencyName: "Bitcoin Cash (BCH)",
                        iconName: 'assets/images/haggle.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/bchgraph.png'),
                    MarketsCard(
                        currencyName: "Dodgecoin (DOGE)",
                        iconName: 'assets/images/dodgeicon.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/dodgegraph.png'),
                    MarketsCard(
                        currencyName: "Litecoin (LTC)",
                        iconName: 'assets/images/litecoin.png',
                        ngnPrice: "NGN 4,272,170",
                        percentIncrease: "+2.43%",
                        graphName: 'assets/images/usdtgraph.png'),
                    ListTile(
                      leading: Text(
                        "Do more with HaggleX",
                        style: kTitleTextStyle.copyWith(fontSize: _tm * 2.3),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    MoreActionsCard(
                      iconName: 'assets/images/send.png',
                      title: "Send money instantly",
                      subtitle: "Send crypto to another wallet",
                    ),
                    MoreActionsCard(
                      iconName: 'assets/images/receive.png',
                      title: "Receive money from anyone",
                      subtitle: "Receive crypto from another wallet",
                    ),
                    MoreActionsCard(
                      iconName: 'assets/images/send.png',
                      title: "Virtual Card",
                      subtitle: "Make faster payments using HaggleX cards",
                    ),
                    MoreActionsCard(
                      iconName: 'assets/images/receive.png',
                      title: "Global Remittance",
                      subtitle: "Send money to anyone, anywhere",
                    ),
                    ListTile(
                      leading: Text(
                        "Trending crypto news",
                        style: kTitleTextStyle.copyWith(fontSize: _tm * 2.3),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                    NewsCard(
                      assetLoc: 'assets/images/cyptonews.jpg',
                      title:
                          "Blockchain Bites: BTC on Ethereum, DeFi's latest stablecoin, the currency cold wars",
                      timeAgo: "6hrs ago",
                      category: "DeFi",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        titleList: ['Home', 'Wallet', '', 'Cryptosave', 'More'],
        iconList: [
          FontAwesomeIcons.home,
          FontAwesomeIcons.wallet,
          FontAwesomeIcons.exchangeAlt,
          FontAwesomeIcons.piggyBank,
          FontAwesomeIcons.plusSquare,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
    );
  }
}
