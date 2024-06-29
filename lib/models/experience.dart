enum JobType {
  fullTime,
  partTime,
  remote,
}

class Experience {
  final DateTime startDate;
  final DateTime endDate;
  final String company;
  final String position;
  final JobType type;
  final List<String> responsibilities;

  Experience({
    required this.company,
    required this.position,
    required this.responsibilities,
    required this.startDate,
    required this.endDate,
    this.type = JobType.fullTime,
  });

  static final List<Experience> ksExperiences = [
    Experience(
      company: "BJS Soft Solutions PVT LTD",
      position: "Sr Flutter Developer",
      responsibilities: [
        "Software House of Austrian Airlines of Lufthansa Group",
        "Lead a team of 10 Developers",
        "Closely collaborated with mobile developers, backend developers, UI/ UX designers and QA team for many apps",
        "Taught Dart & Flutter to Interns",
        "Maintained code quality by reviewing work of junior developers",
      ],
      startDate: DateTime(2023, 8),
      endDate: DateTime.now(),
    ),
    Experience(
      company: "Cyberify",
      position: "Mid-Senior Flutter Developer",
      responsibilities: [
        "Closely collaborated with mobile developers, backend developers, UI/ UX designers and QA team multiple apps",
        """Mainly responsible for 
        ● Project Architecture
        ● Authentication flows,
        ● Third-party integrations,
        """,
      ],
      startDate: DateTime(2022, 1),
      endDate: DateTime(2023, 4),
    ),
    Experience(
      company: "Amtech, LLC",
      position: "Associate Software Engineer",
      responsibilities: [
        "Contributed in Music Food Delivery App, HR Management System and E-commerce app",
        "Started learning Appwrite, Mobx and dynamic modelling in Flutter",
        "Worked closely with UI/UX designer & Backend developer in developing Food Delivery App",
      ],
      startDate: DateTime(2020, 2),
      endDate: DateTime(2021, 12),
    ),
    Experience(
      company: "Mighty Solutions",
      position: "Backend Developer",
      responsibilities: [
        "Started my journey as backend developer using Php & Laravel",
        "Closely collaborated with Mobile App Development team to ensure secure and reliable API development",
        "Worked in Fastbooking.com.pk ( A Logistics Management Website built with Laravel )",
      ],
      startDate: DateTime(2019, 6),
      endDate: DateTime(2020, 1),
    ),
  ];
}
