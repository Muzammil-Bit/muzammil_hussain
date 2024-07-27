class Project {
  final List<String> pngPaths;
  final String name;
  final String description;
  final String languageFramework;
  final String availablePlatforms;
  final String? features;
  final String stateManagement;
  final List<String> links;
  Project({
    required this.pngPaths,
    required this.name,
    required this.description,
    this.languageFramework = "Dart/Flutter",
    this.availablePlatforms = "Android, iOS",
    this.stateManagement = "Bloc",
    this.features,
    this.links = const [],
  }) : assert(pngPaths.isNotEmpty);
}

final List<Project> kProjects = [
  Project(
    pngPaths: [
      for (int i = 1; i <= 20; i++) "assets/images/project-images/ri-${i}.png",
    ],
    name: "Firmware for Rushabh Instruments LLC HISTOPRO 810 Slide Dryer",
    description:
        """It’s a Hardware based Android App using the Proculus module to integrate with the HISTOPRO 810 Slide Dryer laboratory ovens. The targeted device has 8 different stations the user can place the sample in any of the stations. We use Serial Communication to periodically fetch the temperature from Hardware and Display / Store in the application. It is developed in modules that can also be integrated with other Flutter applications developed for Rushabh Instruments LLC, reducing the overall time to develop each application.""",
    availablePlatforms: "Android",
    features:
        "Serial Communication, Developed as libraries that can be implemented in other internal apps",
  ),
  Project(
    pngPaths: [
      for (int i = 1; i < 17; i++)
        "assets/images/project-images/syncwell-${i}.png",
    ],
    name: "SyncWell",
    description:
        """Syncwell is a health tracking application built on top of Apple's Health Kit (for iOS) and Google Fit (for Android). It tracks user's health by periodically fetching and syncing data from Health Kit or Google fit. It offers personalized suggestions for users based on their health and data. The suggestions are generated using ChatGPT 4o Model.""",
    features: "Health_Kit & Google Fit Integration, ChatGPT, Notifications",
  ),
  Project(
      pngPaths: [
        for (int i = 1; i <= 15; i++)
          "assets/images/project-images/ic-${i}.png",
      ],
      links: [
        "https://apps.apple.com/tm/developer/bjs-soft-solutions-llc/id1728433156",
        "https://play.google.com/store/apps/details?id=com.emt.image.pdf.jpg.converter",
      ],
      name: "Image Converter: JPG / PNG",
      description:
          'Image Converter: JPG / PNG is an image utility application. It allows users to seamlessly convert images from on format to other, resize them, crop them or even convert multiple images into a single PDF file (encrypted or non-encrypted).'),
  // Project(
  //   pngPaths: ["assets/images/project-images/aam-express-1.png"],
  //   name: "AAM Express",
  //   description:
  //       """AAM Express is a food Delivery Application currently operating in Multan, Pakistan. It has also has a companion rider's application and an admin panel built on top of react and Laravel as Backend. The app is successfully managing 1k+ orders each month and growing rapidly everyday. The app has capacity of managing over 100k orders each month.""",
  //   features: "Realtime Tracking, GeoFencing, Push notifications",
  // ),
  Project(
    pngPaths: [
      for (int i = 1; i <= 19; i++)
        "assets/images/project-images/urkido-${i}.png",
    ],
    name: "Urkido",
    description:
        """URKIDO is a school bus tracking application. Parents can track their child's school bus and the app notifies the parents when the bus is withing a certain region of the house of school. Parents can assign each child a bus and manage it through the application.""",
    features: "Realtime Bus Tracking, Notifications",
  ),
  Project(
    pngPaths: [
      "assets/images/project-images/speed-test-1.png",
      "assets/images/project-images/speed-test-2.png",
      "assets/images/project-images/speed-test-3.png",
      "assets/images/project-images/speed-test-4.png",
      "assets/images/project-images/speed-test-5.png",
      "assets/images/project-images/speed-test-6.png",
      "assets/images/project-images/speed-test-7.png",
      "assets/images/project-images/speed-test-8.png",
    ],
    links: [
      "https://apps.apple.com/tm/app/wifi-analyzer-wifi-finder/id6479249755",
      "https://play.google.com/store/apps/details?id=com.easymt.wifianalyzer.networkanalyzer.qrcode.internetspeed",
    ],
    name: "Internet Speed Test",
    description:
        """"Internet speed test is a utility application that can be used to measure the speed of the internet at any point. It stored a history of each test so users can compare their internet speed whenever they want. It also also many other useful small utilities like 'Who is using my WIFI', 'Wifi router settings' and a database with default passwords of routes.""",
    features: "Multiple Servers, AdMob, Revenue Cat",
  ),
  Project(
    pngPaths: [
      for (int i = 1; i <= 10; i++)
        "assets/images/project-images/battery-alarm-${i}.png",
    ],
    links: [
      "https://play.google.com/store/apps/details?id=com.emt.lowbatteryalarm.chargealarm"
    ],
    name: "Low Battery Alarm",
    stateManagement: "getX",
    availablePlatforms: "Android",
    description:
        """Battery alarm is also a utility based application with many useful features like displaying realtime device information, charging/discharging status while also be able to set alarm whenever battery reaches a certain point. User's can also review their charing history which is stored by default in the app.""",
    features: "AdMob, Revenue Cat Integration",
  ),
];
