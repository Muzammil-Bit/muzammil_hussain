import 'package:go_router/go_router.dart';
import '../pages/about/about_page.dart';
import '../pages/contact/contact_page.dart';
import '../pages/home/home_page.dart';
import '../pages/works/works_page.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.contact,
      builder: (context, state) => ContactPage(),
    ),
    GoRoute(
      path: Routes.about,
      builder: (context, state) => AboutPage(),
    ),
    GoRoute(
      path: Routes.works,
      builder: (context, state) => WorksPage(),
    ),
  ],
);
