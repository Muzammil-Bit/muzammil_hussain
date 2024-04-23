import 'package:muzammil_hussain/config/assets.dart';

class RecentWork {
  final String title;
  final String imagePath;
  final String playStoreUrl;
  RecentWork({
    required this.title,
    required this.imagePath,
    required this.playStoreUrl,
  });

  static final List<RecentWork> works = [
    RecentWork(
      title: "Image Converter: Jpg Png",
      imagePath: Assets.image_converter_hero,
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.emt.image.pdf.jpg.converter&hl=en&gl=US",
    )
  ];
}
