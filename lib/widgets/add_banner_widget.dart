import '../utils/global_import.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({@required this.assetloc});

  final String assetloc;

  @override
  Widget build(BuildContext context) {
    double _im = SizeConfig.imageSizeMultiplier;
    double _hm = SizeConfig.heightMultiplier;
    return Container(
      height: _hm * 18,
      width: _im * 80,
      margin: EdgeInsets.symmetric(horizontal: _im * 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_im * 3),
        color: kMainColor,
      ),
      child: Image(
        image: AssetImage(assetloc),
        fit: BoxFit.fill,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}
