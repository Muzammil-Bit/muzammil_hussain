class RecentWork {
  final String title;
  final String imagePath;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? appStoreUrl;
  RecentWork({
    required this.title,
    required this.imagePath,
    this.playStoreUrl,
    this.gitHubUrl,
    this.appStoreUrl,
  });

  static final List<RecentWork> works = [
    RecentWork(
        title: "Image Converter: Jpg Png",
        imagePath: "assets/images/1.png",
        playStoreUrl:
            "https://play.google.com/store/apps/details?id=com.emt.image.pdf.jpg.converter&hl=en&gl=US",
        appStoreUrl:
            "https://apps.apple.com/us/app/image-converter-jpg-png-heic/id6476975237"),
    RecentWork(
      title: "SyncWell - Realtime health tracking",
      imagePath: "assets/images/2.png",
    ),
    RecentWork(
      title: "Urkido - Bus tracking",
      imagePath: "assets/images/3.png",
    ),
    RecentWork(
      title: "Asap - Realtime bus tracking",
      imagePath: "assets/images/4.png",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.asap_tracking_flutter.gps&hl=en",
    ),
  ];
}
