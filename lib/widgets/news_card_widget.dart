import '../utils/global_import.dart';

class NewsCard extends StatelessWidget {
  NewsCard({
    @required this.assetLoc,
    @required this.title,
    @required this.timeAgo,
    @required this.category,
  });

  final String title;
  final String assetLoc;
  final String timeAgo;
  final String category;

  @override
  Widget build(BuildContext context) {
    double _tm = SizeConfig.textMultiplier;
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return Card(
      child: ListTile(
        leading: Container(
          height: _hm * 6,
          width: _im * 16,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(_im * 5)),
          child: Image(
            image: AssetImage(assetLoc),
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.darken,
          ),
        ),
        title: Text(
          title,
          style: kTitleTextStyle.copyWith(
              fontSize: _tm * 2.0, fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeAgo,
              style: kTitleTextStyle.copyWith(
                  fontSize: _tm * 1.5,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            RichText(
              text: TextSpan(
                  style: kTitleTextStyle.copyWith(
                    fontSize: _tm * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: "Category: ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(text: category)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
