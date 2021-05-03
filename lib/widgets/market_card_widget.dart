import '../utils/global_import.dart';

class MarketsCard extends StatelessWidget {
  MarketsCard({
    @required this.currencyName,
    @required this.iconName,
    @required this.ngnPrice,
    @required this.percentIncrease,
    @required this.graphName,
  });

  final String currencyName;
  final String iconName;
  final String ngnPrice;
  final String percentIncrease;
  final String graphName;

  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return Card(
      child: ListTile(
        leading: Image.asset(
          iconName,
          height: _hm * 6.5,
        ),
        title: Text(
          currencyName,
          style: kTitleTextStyle.copyWith(
              fontSize: _tm * 2.1, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
        subtitle: Row(
          children: [
            Text(
              ngnPrice,
              style: kTitleTextStyle.copyWith(
                  fontSize: _tm * 1.5, fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: _im * 3.0),
            Text(
              percentIncrease,
              style: kTitleTextStyle.copyWith(
                  fontSize: _tm * 1.8,
                  fontWeight: FontWeight.normal,
                  color: Colors.green),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        trailing: Image.asset(graphName, height: _hm * 6.5, width: _im * 22),
      ),
    );
  }
}
