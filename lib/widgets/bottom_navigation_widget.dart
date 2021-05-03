import '../utils/global_import.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> titleList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange,
      this.titleList});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _titleList = [];

  // TODO: implement initState
  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _titleList = widget.titleList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], _titleList[i], i));
    }

    return Material(
      elevation: 2.0,
      child: Row(
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String title, int index) {
    double _tm = SizeConfig.textMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: _hm * 11,
        width: MediaQuery.of(context).size.width / _iconList.length,
        // decoration: index == _selectedIndex
        //     ? BoxDecoration(
        //         border: Border(
        //           bottom: BorderSide(width: 4, color: Colors.green),
        //         ),
        //         gradient: LinearGradient(colors: [
        //           Colors.green.withOpacity(0.3),
        //           Colors.green.withOpacity(0.015),
        //         ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
        //         // color: index == _selectedItemIndex ? Colors.green : Colors.white,
        //         )
        //     : BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == FontAwesomeIcons.exchangeAlt
                ? Container(
                    padding: EdgeInsets.all(_tm * 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kMainColor,
                    ),
                    child: FaIcon(
                      icon,
                      size: _tm * 2.5,
                      color: kWhiteColor,
                    ),
                  )
                : FaIcon(
                    icon,
                    size: _tm * 3.5,
                    color: index == _selectedIndex ? kMainColor : Colors.grey,
                  ),
            Text(
              title,
              style: kTextStyle.copyWith(
                color: index == _selectedIndex ? kMainColor : Colors.grey,
                fontSize: _tm * 1.6,
                fontWeight: index == _selectedIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
