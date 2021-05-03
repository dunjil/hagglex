import '../utils/global_import.dart';

class MoreActionsCard extends StatelessWidget {
  MoreActionsCard({
    @required this.subtitle,
    @required this.iconName,
    @required this.title,
  });

  final String title;
  final String subtitle;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return Card(
      child: ListTile(
        leading: Image.asset(
          iconName,
          height: _hm * 6.5,
        ),
        title: Text(
          title,
          style: kTitleTextStyle.copyWith(
              fontSize: _tm * 2.1, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          subtitle,
          style: kTitleTextStyle.copyWith(
              fontSize: _tm * 1.7, fontWeight: FontWeight.normal),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
